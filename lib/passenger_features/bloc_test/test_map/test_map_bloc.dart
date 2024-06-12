import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/const/export.dart';
import '../../home_feature/data/models/dropLocation.dart';
import '../../home_feature/data/models/location.dart';
import '../../home_feature/presentation/view/location_map_screen.dart';
import 'test_map_event.dart';
import 'test_map_state.dart';

class TestMapBloc extends Bloc<TestMapEvent, TestMapState> {
  GoogleMapController? mapController;
  final Completer<GoogleMapController> controllerCompleter = Completer();

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  List<LatLng> animatedCoordinates = [];
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polyLines = <Polyline>{};

  String? travelTime;
  Timer? myTimer;

  TestMapBloc() : super(InitState()) {
    on<InitEvent>(_init);
    on<SetPickMarkerEvent>((event, emit) async {
      await setPickMarker(event, emit, event.locationMap);
    });
    on<SetMarkersEvent>((event, emit){
      setMarker(event, emit, event.pickLocationMap, event.dropLocationMap, event.apiKey, event.polyColor);
    });
  }

  void _init(InitEvent event, Emitter<TestMapState> emit) {
    emit(InitState());
  }

  setPickMarker(SetPickMarkerEvent event, Emitter<TestMapState> emit,
      Map locationMap) async {
    //final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickModel = LocationModel.fromMap(locationMap);
    final Uint8List? markerIDOne =
    await getBytesFromAsset(AppAssets.pickPin, (100.h).toInt());
    if (pickModel.lat != 0.0) {
      markers.add(
        Marker(
          markerId: const MarkerId("id-1"),
          icon: BitmapDescriptor.fromBytes(markerIDOne!),
          position: LatLng(pickModel.lat!, pickModel.lng!),
        ),
      );
      emit(SetPickMarkerState(locationMap: locationMap));
    }
  }

  setMarker(SetMarkersEvent event, Emitter<TestMapState> emit,Map pickLocationMap, Map dropLocationMap, String apiKey,
      Color color) async {
    LocationModel pickModel = LocationModel.fromMap(pickLocationMap);
    DropLocationModel dropModel = DropLocationModel.fromMap(dropLocationMap);
    final Uint8List? markerIDOne =
    await getBytesFromAsset(AppAssets.pickPin, (100.h).toInt());
    final Uint8List? markerIDTwo =
    await getBytesFromAsset(AppAssets.dropPin, (100.h).toInt());
    if (dropModel.lat != 0.0 && pickModel.lat != 0.0) {
      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId("id-1"),
          icon: BitmapDescriptor.fromBytes(markerIDOne!),
          position: LatLng(pickModel.lat!, pickModel.lng!),
        ),
      );

      markers.add(
        Marker(
          markerId: const MarkerId("id-2"),
          icon: BitmapDescriptor.fromBytes(markerIDTwo!),
          position: LatLng(dropModel.lat!, dropModel.lng!),
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        setPolyLines(event,emit,pickLocationMap, dropLocationMap, apiKey, color);
      });
    }
  }

  Future<void> setPolyLines(SetMarkersEvent event, Emitter<TestMapState> emit,Map pickLocationMap, Map dropLocationMap,
      String apiKey, Color color) async {
    LocationModel pickModel = LocationModel.fromMap(pickLocationMap);
    DropLocationModel dropModel =
    DropLocationModel.fromMap(dropLocationMap);
    animatedCoordinates.clear();
    polylineCoordinates.clear();
    polyLines.clear();
    polylinePoints = PolylinePoints();
    if (myTimer?.isActive != true) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          apiKey,
          PointLatLng(pickModel.lat!, pickModel.lng!),
          PointLatLng(dropModel.lat!, dropModel.lng!));
      if (result.status == "OK") {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        int i = 0;
        if (myTimer?.isActive != true) {
          myTimer =
              Timer.periodic(const Duration(microseconds: 1000), (timer) {
                if (i <= polylineCoordinates.length) {
                  animatedCoordinates.add(polylineCoordinates[i]);
                  polyLines.add(Polyline(
                    width: 3,
                    visible: true,
                    polylineId: const PolylineId("polyLine"),
                    color: color,
                    points: animatedCoordinates,
                  ));
                  i = i + 1;
                  if (i == polylineCoordinates.length) {
                    zoomPoly(event,emit,pickLocationMap,dropLocationMap,apiKey);
                  }
                } else {
                  myTimer?.cancel();
                }
              });
        } else {
          debugPrint("nothing");
        }
      }
    }
  }

  zoomPoly(SetMarkersEvent event, Emitter<TestMapState> emit,
      Map pickLocationMap, Map dropLocationMap, String apiKey) async {
    List<LatLng> zoomCoordinates = [];
    LocationModel pickModel = LocationModel.fromMap(pickLocationMap);
    DropLocationModel dropModel =
    DropLocationModel.fromMap(dropLocationMap);
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(pickModel.lat!, pickModel.lng!),
        PointLatLng(dropModel.lat!, dropModel.lng!));
    if (result.status == "OK") {
      for (var point in result.points) {
        zoomCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      int? a = zoomCoordinates.length;
      debugPrint("///979///$a");
      int? b = (a / 2).round();
      debugPrint("///979///$b");
      debugPrint("///979///${zoomCoordinates[b]}");
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: zoomCoordinates[b],
            zoom: 12.0,
          ),
        ),
      );
      emit(SetMarkersState(pickLocationMap: event.pickLocationMap, dropLocationMap: event.dropLocationMap, apiKey: event.apiKey, polyColor: event.polyColor));
    }
  }

}

