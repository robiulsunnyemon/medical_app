from rest_framework import viewsets, status
from rest_framework.response import Response
from .models import Medicine,MedicineReview
from rest_framework.views import APIView
from django.contrib.auth.models import User
from rest_framework.decorators import api_view

from .serializers import MedicineSerializer,UserSerializer,MedicineReviewSerializer

class MedicineViewSet(viewsets.ModelViewSet):
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer



class MedicineReviewViewSet(viewsets.ModelViewSet):
    queryset = MedicineReview.objects.all()
    serializer_class = MedicineReviewSerializer


class UserListView(APIView):
    def get(self, request):
        users = User.objects.all()  # সমস্ত ইউজার সংগ্রহ করা
        serializer = UserSerializer(users, many=True)  # Serializer দিয়ে JSON ফরম্যাটে রূপান্তর
        return Response(serializer.data, status=status.HTTP_200_OK)


class BulkMedicineSerializer(APIView):
    def post(self, request):
        serializer = MedicineSerializer(data=request.data, many=True)
        if serializer.is_valid():
            medicine = [Medicine(**data) for data in serializer.validated_data]
            Medicine.objects.bulk_create(medicine)
            return Response({"message": "Medicine created successfully!"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




class BulkMedicineReviewSerializer(APIView):
    def post(self, request):
        serializer = MedicineReviewSerializer(data=request.data, many=True)
        if serializer.is_valid():
            review = [MedicineReview(**data) for data in serializer.validated_data]
            MedicineReview.objects.bulk_create(review)
            return Response({"message": "Medicine created successfully!"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    


@api_view(['GET'])
def medicine_by_name(request, name):
 
    medicines = Medicine.objects.filter(name__icontains=name)
  
    if not medicines:
        return Response({"message": "No medicines found with that name"}, status=404)
    
    serializer = MedicineSerializer(medicines, many=True)
    return Response(serializer.data)    




@api_view(['GET'])
def medicine_by_description(request, description):
 
    medicines = Medicine.objects.filter(description__icontains=description)
  
    if not medicines:
        return Response({"message": "No medicines found with that description"}, status=404)
    
    serializer = MedicineSerializer(medicines, many=True)
    return Response(serializer.data)    


@api_view(['GET'])
def medicine_by_manufacturer(request, manufacturer):
    # manufacturer ফিল্ড অনুযায়ী Medicine মডেল ফিল্টার করা
    medicines = Medicine.objects.filter(manufacturer__icontains=manufacturer)
    
    # যদি কোনো medicine পাওয়া না যায়
    if not medicines:
        return Response({"message": "No medicines found from that manufacturer"}, status=404)
    
    # ফিল্টার করা ডাটা সিরিয়ালাইজ করা
    serializer = MedicineSerializer(medicines, many=True)
    return Response(serializer.data)


# ## review by medicine

@api_view(['GET'])
def filter_reviews_by_medicine(request):
    # Get the 'medicine' parameter from the query string
    medicine_id = request.query_params.get('medicine', None)

    if medicine_id is not None:
        # Filter reviews by the medicine id
        reviews = MedicineReview.objects.filter(medicine_id=medicine_id)

        # Serialize the data
        serializer = MedicineReviewSerializer(reviews, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    else:
        # If medicine parameter is not provided, return all reviews
        reviews = MedicineReview.objects.all()
        serializer = MedicineReviewSerializer(reviews, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    




class UserDetailView(APIView):
    def get(self, request, pk):
        try:
            user = User.objects.get(pk=pk)  # ইউজার আইডি দিয়ে ইউজার খোঁজা
            serializer = UserSerializer(user)  # সিরিয়ালাইজার দিয়ে ইউজারের ডিটেইলস পাওয়া
            return Response(serializer.data, status=status.HTTP_200_OK)  # ইউজারের ডিটেইলস রিটার্ন করা
        except User.DoesNotExist:
            return Response({"error": "User not found"}, status=status.HTTP_404_NOT_FOUND)
