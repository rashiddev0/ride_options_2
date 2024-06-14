import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../../common/const/export.dart';
import '../../../../passenger_features/home_feature/data/models/location.dart';
import '../../../../passenger_features/home_feature/presentation/view/location_map_screen.dart';
import 'driver_inride_event.dart';
import 'driver_inride_state.dart';

class DriverInRideBloc extends Bloc<DriverInRideEvent, DriverInRideState> {
  GoogleMapController? mapController;
  final Completer<GoogleMapController> controllerCompleter = Completer();

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  List<LatLng> animatedCoordinates = [];
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polyLines = <Polyline>{};

  Timer? myTimer;

  Map pickLocation = {
    'address':
        "F8F9+9Q7 F- Block Ground, Block F Model Town, Lahore, Punjab, Pakistan",
    "title": "F8F9+9Q7 F- Block Ground",
    "city": "Lahore",
    "country": "Pakistan",
    'lat': 31.47315122079532,
    'lng': 74.31944869458675,
  };

  DriverInRideBloc() : super(const DriverInRideState().init()) {
    on<InitEvent>(_init);
    on<MarkerSetEvent>((event, emit) async {
      await setMarkers(
          event, emit, event.driPinMap, event.pickLocMap, event.apiKey);
    });
    on<SetPolyLineEvent>(setPoly);
  }

  void _init(InitEvent event, Emitter<DriverInRideState> emit) async {
    emit(state.clone());
  }

  setMarkers(
    MarkerSetEvent event,
    Emitter<DriverInRideState> emit,
    Map driPinMap,
    Map pickLocMap,
    String apiKey,
  ) async {
    LocationModel driPinModel = LocationModel.fromMap(driPinMap);
    LocationModel pickPinModel = LocationModel.fromMap(pickLocMap);

    final Uint8List? markerIDOne =
        await getBytesFromAsset(AppAssets.driverPin, (100.h).toInt());

    final Uint8List? markerIDTwo =
        await getBytesFromAsset(AppAssets.pickPin, (100.h).toInt());

    if (driPinModel.lat != 0.0 && pickPinModel.lat != 0.0) {
      markers.clear();

      markers.add(
        Marker(
          markerId: const MarkerId("id-1"),
          icon: BitmapDescriptor.fromBytes(markerIDOne!),
          position: LatLng(driPinModel.lat!, driPinModel.lng!),
          rotation: calculateBearing(LatLng(driPinModel.lat!, driPinModel.lng!),
              LatLng(pickPinModel.lat!, pickPinModel.lng!)),
        ),
      );

      markers.add(
        Marker(
          markerId: const MarkerId("id-2"),
          icon: BitmapDescriptor.fromBytes(markerIDTwo!),
          position: LatLng(pickPinModel.lat!, pickPinModel.lng!),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () async {
        await setPolyLines(event, emit, driPinMap, pickLocMap, apiKey);
      });

      emit(MarkerSetState(
          driPinMap: driPinMap,
          pickLocMap: pickLocMap,
          //color: color,
          apiKey: apiKey));
    }
  }

  Future<void> setPolyLines(
    MarkerSetEvent event,
    Emitter<DriverInRideState> emit,
    Map driPinMap,
    Map pickLocMap,
    String apiKey,
    //Color color
  ) async {
    LocationModel driPinModel = LocationModel.fromMap(driPinMap);
    LocationModel pickPinModel = LocationModel.fromMap(pickLocMap);

    animatedCoordinates.clear();
    polylineCoordinates.clear();
    polyLines.clear();
    polylinePoints = PolylinePoints();
    if (myTimer?.isActive != true) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          apiKey,
          PointLatLng(driPinModel.lat!, driPinModel.lng!),
          PointLatLng(pickPinModel.lat!, pickPinModel.lng!));
      if (result.status == "OK") {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        int i = 0;
        if (myTimer?.isActive != true) {
          myTimer = Timer.periodic(const Duration(microseconds: 1000), (timer) {
            if (i < polylineCoordinates.length) {
              animatedCoordinates.add(polylineCoordinates[i]);
              polyLines.add(Polyline(
                width: 3,
                visible: true,
                polylineId: const PolylineId("polyLine"),
                color: AppColors.primary,
                points: animatedCoordinates,
              ));
              i = i + 1;
              /*if (!emit.isDone) {
                emit((MarkerSetState(
                    driPinMap: driPinMap,
                    pickLocMap: pickLocMap,
                    //color: color,
                    apiKey: apiKey)));
              }*/
              emit.isDone == true
                  ? debugPrint("////151///")
                  : emit((MarkerSetState(
                      driPinMap: driPinMap,
                      pickLocMap: pickLocMap,
                      //color: color,
                      apiKey: apiKey)));
              //emit.isDone == true ? emit(SetPoly()) : emit(SetPoly());
            } else {
              myTimer?.cancel();
              emit.isDone == true
                  ? (MarkerSetState(
                      driPinMap: driPinMap,
                      pickLocMap: pickLocMap,
                      //color: color,
                      apiKey: apiKey))
                  : emit(MarkerSetState(
                      driPinMap: driPinMap,
                      pickLocMap: pickLocMap,
                      //color: color,
                      apiKey: apiKey));
            }
          });
        } else {
          debugPrint("nothing");
        }
      }
    }
  }

  setPoly(
    SetPolyLineEvent event,
    Emitter<DriverInRideState> emit,
  ) {
    emit(SetPolyLineState());
  }

  double toRadians(double degrees) {
    return degrees * (3.141592653589793 / 180); // π/180
  }

  double toDegrees(double radians) {
    return radians * (180 / 3.141592653589793); // 180°/π
  }

  double calculateBearing(LatLng startPoint, LatLng endPoint) {
    final double startLat = toRadians(startPoint.latitude);
    final double startLng = toRadians(startPoint.longitude);
    final double endLat = toRadians(endPoint.latitude);
    final double endLng = toRadians(endPoint.longitude);

    final double deltaLng = endLng - startLng;
    final double y = sin(deltaLng) * cos(endLat);
    final double x = cos(startLat) * sin(endLat) -
        sin(startLat) * cos(endLat) * cos(deltaLng);
    final double bearing = atan2(y, x);

    return (toDegrees(bearing) + 360) % 360;
  }

  openMap(LatLng pickLocation, LatLng dropLocation) async {
    final availableMaps = await MapLauncher.installedMaps;
    if (availableMaps.isNotEmpty) {
      await availableMaps.first.showDirections(
        origin: Coords(pickLocation.latitude, pickLocation.longitude),
        destination: Coords(dropLocation.latitude, dropLocation.longitude),
      );
    } else {
      throw 'No maps app installed.';
    }
  }
}
