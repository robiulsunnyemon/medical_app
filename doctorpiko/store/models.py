from django.db import models
from django.contrib.auth.models import User

class Medicine(models.Model):
    name = models.CharField(max_length=255)
    manufacturer = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.PositiveIntegerField()
    description = models.TextField(blank=True, null=True)  # Description field added
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class MedicineReview(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE,related_name="reviews")
    firstName=models.CharField(max_length=250)
    comment = models.CharField(max_length=1000)
    medicine=models.ForeignKey(Medicine, on_delete=models.CASCADE,related_name="reviews")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.comment