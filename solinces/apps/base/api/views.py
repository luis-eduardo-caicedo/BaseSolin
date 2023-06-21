from rest_framework.generics import ListAPIView

from solinces.apps.base.api.serializers import CitySerializer, TypeDocumentSerializer
from solinces.apps.base.models import City, TypeDocument
from solinces.apps.base.utils import StandardResultsPagination
from solinces.utils.mixins import APIBasePermissionsMixin


# Api of  City
class CityAPIView(APIBasePermissionsMixin, ListAPIView):
    serializer_class = CitySerializer
    queryset = City.objects.activos()
    pagination_class = StandardResultsPagination


# Api of  Type Documents
class TypeDocumentAPIView(APIBasePermissionsMixin, ListAPIView):
    serializer_class = TypeDocumentSerializer
    queryset = TypeDocument.objects.activos()
    pagination_class = StandardResultsPagination
