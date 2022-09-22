from django.contrib.auth.models import User, Group
from rest_framework import viewsets

from rest_api.models import CoFacility, CoPopuDensity, CoVaccine, CoWeekday
from rest_api.serializers import CoFacilitySerializer, CoPopuDensitySerializer, CoVaccineSerializer, CoWeekdaySerializer



class CoFacilityViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = CoFacility.objects.all().order_by('-std_day')
    serializer_class = CoFacilitySerializer
    # permission_classes = [permissions.IsAuthenticated]


class CoPopuDensityViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = CoPopuDensity.objects.all().order_by('-std_day')
    serializer_class = CoPopuDensitySerializer
    # permission_classes = [permissions.IsAuthenticated]

class CoVaccineViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = CoVaccine.objects.all().order_by('-std_day')
    serializer_class = CoVaccineSerializer
    # permission_classes = [permissions.IsAuthenticated]


class CoWeekdayViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = CoWeekday.objects.all().order_by('-std_day')
    serializer_class = CoWeekdaySerializer
    # permission_classes = [permissions.IsAuthenticated]

