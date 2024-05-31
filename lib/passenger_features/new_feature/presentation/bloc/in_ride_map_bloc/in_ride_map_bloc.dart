import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/const/export.dart';
import 'in_ride_map_event.dart';
import 'in_ride_map_state.dart';

class InRideMapBloc extends Bloc<InRideMapEvent, InRideMapState> {
  List<String> cancelReasons = [
    "Waiting for long time",
    "Unable to contact driver",
    "Driver denied to go",
    "Driver is not coming to pick",
    "Wrong address shown",
    "The price in not reasonable"
  ];

  TextEditingController cancelReasonController = TextEditingController();

  GoogleMapController? controller;
  final Completer<GoogleMapController> controllerCompleter = Completer();

  LatLng centerLocation = const LatLng(41.4219057, -102.0840772);
  Set<Marker> markers = {};

  bool? enableDrag;

  InRideMapBloc() : super(InRideMapState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<InRideMapState> emit) async {
    emit(state.clone());
  }

  isDrag() {
    enableDrag = !enableDrag!;
    emit(EnableDrag());
  }
}
