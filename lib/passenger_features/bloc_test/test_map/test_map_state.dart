import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class TestMapState extends Equatable {
  const TestMapState();

  @override
  List<Object> get props => [];
}

class InitState extends TestMapState {}
// ignore: must_be_immutable
class SetPickMarkerState extends TestMapState {
  Map locationMap;

  SetPickMarkerState({required this.locationMap});
}
// ignore: must_be_immutable
class SetMarkersState extends TestMapState {
  Map pickLocationMap;
  Map dropLocationMap;
  String apiKey;
  Color polyColor;

  SetMarkersState(
      {required this.pickLocationMap,
      required this.dropLocationMap,
      required this.apiKey,
      required this.polyColor});
}
