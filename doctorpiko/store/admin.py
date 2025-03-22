from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Medicine,MedicineReview

@admin.register(Medicine)
class MedicineAdmin(admin.ModelAdmin):
    list_display = ('name', 'manufacturer', 'price', 'stock', 'description', 'created_at')
    search_fields = ('name', 'manufacturer', 'description')
    list_filter = ('manufacturer',)



@admin.register(MedicineReview)
class MedicineAdmin(admin.ModelAdmin):
    list_display = ('comment','user','firstName', 'medicine','created_at')
    search_fields=('medicine',"comment")



class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'is_active', 'date_joined')

admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)