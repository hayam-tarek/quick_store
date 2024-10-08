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
