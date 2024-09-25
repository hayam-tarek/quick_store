import 'dart:developer';

import 'package:bloc/bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('close: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    //  implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    //  implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    //  implement onTransition
  }
}
