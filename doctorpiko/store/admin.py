from django.contrib import admin
from .models import Medicine

@admin.register(Medicine)
class MedicineAdmin(admin.ModelAdmin):
    list_display = ('name', 'manufacturer', 'price', 'stock', 'description', 'created_at')
    search_fields = ('name', 'manufacturer', 'description')
    list_filter = ('manufacturer',)
