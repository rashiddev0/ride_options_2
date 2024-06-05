import '../../../../../common/const/export.dart';
import 'home_state.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class GetLocation extends HomeEvent {}

class GetPrediction extends HomeEvent {}

class ClearPickLocationEvent extends HomeEvent{}
