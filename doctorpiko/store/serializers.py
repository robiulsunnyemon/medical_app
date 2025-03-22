from rest_framework import serializers
from .models import Medicine,MedicineReview
from django.contrib.auth.models import User


class MedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicine
        fields = '__all__'




class MedicineReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicineReview
        fields = '__all__'



class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name', 'is_active', 'date_joined']