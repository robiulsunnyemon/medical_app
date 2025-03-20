from django.db import models

class Medicine(models.Model):
    name = models.CharField(max_length=255)
    manufacturer = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.PositiveIntegerField()
    description = models.TextField(blank=True, null=True)  # Description field added
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
