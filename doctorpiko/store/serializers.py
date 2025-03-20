from rest_framework import serializers
from .models import Medicine


class MedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicine
        fields = '__all__'

# class BulkMedicineSerializer(serializers.ListSerializer):
#     child = MedicineSerializer()

#     def create(self, validated_data):
#         medicines = [Medicine(**item) for item in validated_data]
#         return Medicine.objects.bulk_create(medicines)



