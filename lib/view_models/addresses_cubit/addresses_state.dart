part of 'addresses_cubit.dart';

@immutable
sealed class AddressesState {}

final class AddressesInitial extends AddressesState {}

final class AddAddressLoading extends AddressesState {}

final class AddAddressFailure extends AddressesState {
  final String message;

  AddAddressFailure({required this.message});
}

final class AddAddressSuccess extends AddressesState {
  final String message;

  AddAddressSuccess({required this.message});
}

final class GetAddressesLoading extends AddressesState {}

final class GetAddressesFailure extends AddressesState {
  final String message;

  GetAddressesFailure({required this.message});
}

final class GetAddressesSuccess extends AddressesState {}

final class DeleteAddressFailure extends AddressesState {
  final String message;

  DeleteAddressFailure({required this.message});
}

final class DeleteAddressSuccess extends AddressesState {
  final String message;

  DeleteAddressSuccess({required this.message});
}

final class DeleteAddressLoading extends AddressesState {}
