part of 'location_services_cubit.dart';

@immutable
sealed class LocationServicesState {}

final class LocationServicesInitial extends LocationServicesState {}

final class LocationServicesAreDisabled extends LocationServicesState {}

final class LocationPermissionsAreDenied extends LocationServicesState {}

final class LocationPermissionsAreDeniedForever extends LocationServicesState {}

final class LocationServicesAreEnabled extends LocationServicesState {}

final class LocationServicesException extends LocationServicesState {
  final String message;

  LocationServicesException({required this.message});
}
