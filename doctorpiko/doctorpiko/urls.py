
from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from store.views import MedicineViewSet,BulkMedicineSerializer,medicine_by_name,medicine_by_description,medicine_by_manufacturer,UserListView,UserDetailView,BulkMedicineReviewSerializer,MedicineReviewViewSet,filter_reviews_by_medicine

router = DefaultRouter()
router.register('medicines', MedicineViewSet)
router.register('review', MedicineReviewViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api/bulk_medicine/', BulkMedicineSerializer.as_view(), name='bulk-medicine'),
    path('api/bulk_review/', BulkMedicineReviewSerializer.as_view(), name='bulk-review'),
    path('api/medicine_n/<str:name>/', medicine_by_name, name='medicine_by_name'),
    path('api/medicine_d/<str:description>/', medicine_by_description, name='medicine_by_description'),
    path('api/medicine_m/<str:manufacturer>/', medicine_by_manufacturer, name='medicine_by_manufacturer'),
    path('api/medicine-reviews/', filter_reviews_by_medicine, name='filter-reviews-by-medicine'),
    path('api/users/', UserListView.as_view(), name='user-list'),
    path('api/users/<int:pk>/', UserDetailView.as_view(), name='user-detail'),


]
