import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/ride_selection_sheet.dart';

import '../../../../../common/const/export.dart';
import '../../../data/models/location.dart';
import '../../bloc/homeBloc/home_bloc.dart';
import '../../bloc/homeBloc/home_state.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({super.key});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {

  int a = 0;
  late PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polyLines = <Polyline>{};

  @override
  void initState() {
    // TODO: implement initState
    polyLines.clear();
    polylineCoordinates.clear();
    polylinePoints = PolylinePoints();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setMarkerAndPolyLine();
    debugPrint("///24///");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickLocation =
    LocationModel.fromMap(homeBloc.pickLocationMap);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pickLocation.lat != null
          ? BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                top: 0.h,
                left: 0.w,
                right: 0.w,
                bottom: homeBloc.dropLocationController.text.isNotEmpty ? 420.h : 100.h,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) async {
                    homeBloc.controllerCompleter.complete(controller);
                    homeBloc.controller = controller;
                  },
                  markers: homeBloc.markers,
                  polylines: polyLines.isEmpty ? {} : <Polyline>{polyLines.last},
                  buildingsEnabled: false,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: MapType.terrain,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(pickLocation.lat!, pickLocation.lng!),
                    zoom: 16,
                  ),

                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: homeBloc.dropLocationMap.isNotEmpty ? .5 : .12,
                minChildSize: homeBloc.dropLocationMap.isNotEmpty ? .5 : .12,
                maxChildSize: 0.5,
                builder: (BuildContext context, scrollSheetController) {
                  return RideSelectionSheet(scrollController: scrollSheetController,);
                },
              ),
            ],
          );
        },
      )
          : const Center(
        child: Text("Loading"),
      ),
    );
  }

  setMarkerAndPolyLine() async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    print("////143///${homeBloc.pickLocationMap}");
    print("////144///${homeBloc.dropLocationMap}");
    homeBloc.markers.clear();
    final Uint8List? markerIDOne = await getBytesFromAsset(
        AppAssets.pickPin,
        (100.h).toInt());
    final Uint8List? markerIDTwo = await getBytesFromAsset(
        AppAssets.dropPin,
        (100.h).toInt());
    if(homeBloc.pickLocationMap["lat"] != null){
      setState(() {
        homeBloc.markers.add(
          Marker(
            markerId: const MarkerId("id-1"),
            icon: BitmapDescriptor.fromBytes(markerIDOne!),
            position: LatLng(homeBloc.pickLocationMap["lat"]!,
                homeBloc.pickLocationMap["lng"]!),
          ),
        );
      });
    }
print("////110///${homeBloc.dropLocationMap["lat"]}");
    if(homeBloc.dropLocationMap["lat"] != null){
      if(a == 0){
        setPolyLines();
        a = a+1;
      }
      setState(() {
        homeBloc.markers.add(
          Marker(
            markerId: const MarkerId("id-2"),
            icon: BitmapDescriptor.fromBytes(markerIDTwo!),
            position: LatLng(homeBloc.dropLocationMap["lat"],
                homeBloc.dropLocationMap["lng"]),
          ),
        );
      });
    }
  }

  Future<void> setPolyLines() async {
    print("///179");
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        homeBloc.apiKey,
        PointLatLng(
            homeBloc.pickLocationMap["lat"], homeBloc.pickLocationMap["lng"]),
        PointLatLng(homeBloc.dropLocationMap["lat"],
            homeBloc.dropLocationMap["lng"]));
    if (result.status == "OK") {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {
        polyLines.add(Polyline(
          width: 5,
          visible: true,
          polylineId: const PolylineId("polyLine"),
          color: AppColors.black,
          points: polylineCoordinates,
        ));
      });
    }
  }
}

Future<Uint8List?> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
      ?.buffer
      .asUint8List();
}
