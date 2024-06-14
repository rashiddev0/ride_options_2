import 'dart:ui';

import 'package:equatable/equatable.dart';

class DriverInRideState extends Equatable{
  const DriverInRideState();
  DriverInRideState init() {
    return const DriverInRideState();
  }

  DriverInRideState clone() {
    return const DriverInRideState();
  }
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class MarkerSetState extends DriverInRideState{
  Map driPinMap,pickLocMap;
  String apiKey;
  //Color color;

  MarkerSetState(
      {required this.driPinMap,
        required this.pickLocMap,
        required this.apiKey,
        //required this.color
      });
}

class SetPolyLineState extends DriverInRideState{}
