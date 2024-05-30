import 'package:geolocator/geolocator.dart';
import 'package:ride_options_2/passenger_features/new_feature/data/models/dropLocation.dart';
import 'package:ride_options_2/passenger_features/new_feature/data/models/location.dart';

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

class PickLocationController extends HomeState {
  final bool isActive;
  PickLocationController(this.isActive);
}
