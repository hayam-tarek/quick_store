import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'location_services_state.dart';

class LocationServicesCubit extends Cubit<LocationServicesState> {
  LocationServicesCubit() : super(LocationServicesInitial());
  Position? currentPosition;
  String? name;
  String? city;
  String? region;
  String? details;
  double? longitude;
  double? latitude;

  determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LocationServicesAreDisabled());
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationPermissionsAreDenied());
          // return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(LocationPermissionsAreDeniedForever());
        // return;
      }
      emit(LocationServicesLoading());
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
      //Current location
      currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      if (currentPosition != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude,
          currentPosition!.longitude,
        );
        name = placemarks[0].name;
        city = placemarks[0].administrativeArea;
        region = placemarks[0].subAdministrativeArea;
        details = placemarks[0].street;
        latitude = currentPosition!.latitude;
        longitude = currentPosition!.longitude;

        emit(LocationServicesAreEnabled());
      }
    } on Exception catch (e) {
      emit(LocationServicesException(message: e.toString()));
    }

    //Last known location
    // Position? lastPosition = await Geolocator.getLastKnownPosition();
    // return lastPosition;
  }

  determineDetailsOfLatLng({required LatLng latLng}) async {
    emit(DetermineDetailsOfLatLngLoading());
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      name = placemarks[0].name;
      city = placemarks[0].administrativeArea;
      region = placemarks[0].subAdministrativeArea;
      details = placemarks[0].street;
      latitude = latLng.latitude;
      longitude = latLng.longitude;
      emit(DetermineDetailsOfLatLngSuccess());
    } on Exception catch (e) {
      emit(DetermineDetailsOfLatLngFailure(message: e.toString()));
    }
  }
}
