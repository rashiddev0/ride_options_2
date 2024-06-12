import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_options_2/passenger_features/home_feature/data/models/location.dart';

import '../../../../../common/const/export.dart';
import 'home_state.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class GetLocation extends HomeEvent {}

class GetPrediction extends HomeEvent {}

class ClearPickLocationEvent extends HomeEvent {}

/*class LocationMapEvent extends HomeEvent {
  LocationModel model;
  Map locationMap;
  String markerIcon;
  Set<Marker> markers;
  Uint8List? markerID;

  LocationMapEvent(
      {required this.model,
      required this.locationMap,
      required this.markerIcon,
      required this.markers,
      required this.markerID});
}*/
