import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_services_state.dart';

class LocationServicesCubit extends Cubit<LocationServicesState> {
  LocationServicesCubit() : super(LocationServicesInitial());
  Position? currentPosition;
  String? name;
  String? city;
  String? region;
  String? details;
  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
      emit(LocationServicesAreDisabled());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        emit(LocationPermissionsAreDenied());
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions.');
      emit(LocationPermissionsAreDeniedForever());
      return;
    }

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

      emit(LocationServicesAreEnabled());
    }

    //Last known location
    // Position? lastPosition = await Geolocator.getLastKnownPosition();
    // return lastPosition;
  }
}
