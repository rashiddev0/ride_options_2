import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class TestMapEvent extends Equatable {
  const TestMapEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends TestMapEvent {}
// ignore: must_be_immutable
class SetPickMarkerEvent extends TestMapEvent {
  Map locationMap;

  SetPickMarkerEvent({required this.locationMap});
}
// ignore: must_be_immutable
class SetMarkersEvent extends TestMapEvent {
  Map pickLocationMap;
  Map dropLocationMap;
  String apiKey;
  Color polyColor;

  SetMarkersEvent(
      {required this.pickLocationMap,
      required this.dropLocationMap,
      required this.apiKey,
      required this.polyColor});
}
