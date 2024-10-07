import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_services_state.dart';

class LocationServicesCubit extends Cubit<LocationServicesState> {
  LocationServicesCubit() : super(LocationServicesInitial());
  Position? currentPosition;
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
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions.');
      emit(LocationPermissionsAreDeniedForever());
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
      log('Current position: $currentPosition');
      emit(LocationServicesAreEnabled());
    }

    //Last known location
    // Position? lastPosition = await Geolocator.getLastKnownPosition();
    // return lastPosition;
  }
}
