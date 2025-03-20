from rest_framework import viewsets, status
from rest_framework.response import Response
from .models import Medicine
from rest_framework.views import APIView
from rest_framework.decorators import api_view

from .serializers import MedicineSerializer

class MedicineViewSet(viewsets.ModelViewSet):
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer



class BulkMedicineSerializer(APIView):
    def post(self, request):
        serializer = MedicineSerializer(data=request.data, many=True)
        if serializer.is_valid():
            medicine = [Medicine(**data) for data in serializer.validated_data]
            Medicine.objects.bulk_create(medicine)
            return Response({"message": "Medicine created successfully!"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# @api_view(['GET'])
# def medicine_by_name(request, name):
#     name = Medicine.objects.filter(name__icontains=name)  
#     serializer = MedicineSerializer(name, many=True)
#     return Response(serializer.data)
    

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