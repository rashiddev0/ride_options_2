

import '../../../../../common/const/export.dart';
import '../../../data/models/dropLocation.dart';
import '../../../data/models/location.dart';

abstract class HomeState {}

class LocationInitial extends HomeState {}

class LocationLoaded extends HomeState {
  final LocationModel pickLocModel;
  LocationLoaded(this.pickLocModel);
}

class DropLocationLoaded extends HomeState {
  final DropLocationModel dropLocModel;

  DropLocationLoaded(this.dropLocModel);
}

class LocationError extends HomeState {
  final String message;

  LocationError(this.message);
}

class GetLocationPrediction extends HomeState {}

class PredictionError extends HomeState {}

class RideIndex extends HomeState {}

class HideButton extends HomeState{
  final bool hideButton;
  HideButton({required this.hideButton});
}


class PickLocationController extends HomeState {
  final bool pickLocController;
  PickLocationController(this.pickLocController);
}

class ClearPickLocation extends HomeState{
  TextEditingController controller;
  Map locationMap;
  ClearPickLocation({required this.controller,required this.locationMap});
}

class SetLocation extends HomeState{}
