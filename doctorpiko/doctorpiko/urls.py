
from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from store.views import MedicineViewSet,BulkMedicineSerializer,medicine_by_name,medicine_by_description,medicine_by_manufacturer

router = DefaultRouter()
router.register('medicines', MedicineViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api/bulk_medicine/', BulkMedicineSerializer.as_view(), name='bulk-medicine-questions'),
    path('api/medicine/<str:name>/', medicine_by_name, name='medicine_by_name'),
    path('api/medicine_d/<str:description>/', medicine_by_description, name='medicine_by_description'),
    path('api/medicine_m/<str:manufacturer>/', medicine_by_manufacturer, name='medicine_by_manufacturer'),


]
