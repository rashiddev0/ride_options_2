import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define your states
// ignore: constant_identifier_names
enum InternetState { Initial, Gained, Lost }

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial) {
    // connectivitySubscription =
    //     Connectivity().onConnectivityChanged.listen((result) {
    //   _checkInitialConnectivity();
    // });
  }

  Future<void> _checkInitialConnectivity() async {
    // var connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult.contains(ConnectivityResult.mobile) ||
    //     connectivityResult.contains(ConnectivityResult.wifi)) {
    //   emit(InternetState.Gained);
    // } else {
    //   emit(InternetState.Lost);
    // }
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
