import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  static determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions.');
      return null;
    }

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    //Current location
    Position currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    return currentPosition;

    //Last known location
    // Position? lastPosition = await Geolocator.getLastKnownPosition();
    // return lastPosition;
  }
}
