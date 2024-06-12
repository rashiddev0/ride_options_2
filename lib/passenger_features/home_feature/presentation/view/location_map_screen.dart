import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_options_2/passenger_features/home_feature/data/models/dropLocation.dart';
import 'package:sheet/sheet.dart';

import '../../../../../common/const/export.dart';
import '../../data/models/location.dart';
import '../bloc/homeBloc/home_bloc.dart';
import '../bloc/homeBloc/home_state.dart';
import 'components/ride_selection_sheet.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({super.key});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen>
    with TickerProviderStateMixin {
  int a = 0;
  late PolylinePoints polylinePoints;
  List<LatLng> animatedCoordinates = [];
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polyLines = <Polyline>{};
  SheetController sheetController = SheetController();
  GoogleMapController? mapController;
  final Completer<GoogleMapController> controllerCompleter = Completer();
  String? travelTime;
  bool showSheet = true;

  Set<Marker> markers = {};
  Timer? myTimer;

  @override
  void initState() {
    // TODO: implement initState
    animatedCoordinates.clear();
    polylineCoordinates.clear();
    polyLines.clear();
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await setMarkerAndPolyLine();
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
                      /*bottom: homeBloc.dropLocationController.text.isNotEmpty
                          ? showSheet == false ? 0.h : 400.h
                          : showSheet == false ? 0.h : 100.h,*/
                      bottom: showSheet == false ? 0.h : 415.h,
                      child: GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          setState(() async {
                            controllerCompleter.complete(controller);
                            mapController = controller;
                            LocationModel pickModel =
                                LocationModel.fromMap(homeBloc.pickLocationMap);

                            DropLocationModel dropModel =
                                DropLocationModel.fromMap(
                                    homeBloc.dropLocationMap);
                            if (dropModel.lat != 0.0) {
                              zoomPoly();
                              travelTime = await homeBloc.getTravelTime(
                                  pickModel.lat!,
                                  pickModel.lng!,
                                  dropModel.lat!,
                                  dropModel.lng!);
                            }
                          });
                        },
                        markers: markers,
                        polylines: polyLines.isEmpty ? {} : polyLines,
                        buildingsEnabled: false,
                        liteModeEnabled: true,
                        myLocationEnabled: true,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        mapToolbarEnabled: false,

                        mapType: MapType.terrain,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(pickLocation.lat!, pickLocation.lng!),
                          zoom: 16,
                        ),
                        onCameraMove: (CameraPosition position) {
                          setState(() {
                            showSheet = false;
                          });
                          //pick current location
                          homeBloc.centerLocation = position.target;
                        },
                        onCameraIdle: () {
                          setState(() {
                            showSheet = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      // top: homeBloc.dropLocationController.text.isNotEmpty ? 380.h : 650.h,
                      top: 380.h,
                      left: 330.w,
                      child: InkWell(
                        onTap: () {
                          centerButton();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.centerLocationIcon,
                            height: 22.5,
                            width: 22.5,
                          ),
                        ),
                      ),
                    ),
                    DraggableScrollableSheet(
                      /*initialChildSize:
                          homeBloc.dropLocationMap.isNotEmpty ? .5 : .12,
                      minChildSize:
                          homeBloc.dropLocationMap.isNotEmpty ? .5 : .12,
                      maxChildSize: 0.5,*/
                      initialChildSize: showSheet == false ? 0.h : .5,
                      minChildSize: showSheet == false ? 0.h : .5,
                      maxChildSize: showSheet == false ? 0.h : 0.5,
                      builder: (BuildContext context, scrollSheetController) {
                        return RideSelectionSheet(
                          scrollController: scrollSheetController,
                          travelTime: travelTime ?? "0.0",
                        );
                      },
                    ),
                    /*Visibility(
                      visible: showSheet,
                      child: SimpleGestureDetector(
                        onVerticalSwipe: (SwipeDirection direction){
                          setState(() {
                            if (direction == SwipeDirection.up) {
                              print('////126///Swiped up!');
                            } else {
                              print('////128////Swiped down!');
                            }
                          });
                        },
                        swipeConfig: const SimpleSwipeConfig(
                          verticalThreshold: 40.0,
                          horizontalThreshold: 40.0,
                          swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
                        ),
                        child: Sheet(
                          initialExtent:
                              homeBloc.dropLocationMap.isNotEmpty ? 400.h : 100.h,
                          minExtent:
                              homeBloc.dropLocationMap.isNotEmpty ? 400.h : 100.h,
                          maxExtent: 400.h,
                          controller: sheetController,
                          fit: SheetFit.expand,
                          child: RideSelectionSheet(
                            travelTime: travelTime ?? "0.0",
                          ),
                        ),
                      ),
                    ),*/
                    /*Sheet(
                      initialExtent:
                      homeBloc.dropLocationMap.isNotEmpty ? showSheet == false ? 0.h : 400.h : showSheet == false ? 0.h : 100.h,
                      minExtent:
                      homeBloc.dropLocationMap.isNotEmpty ? showSheet == false ? 0.h : 400.h : showSheet == false ? 0.h : 100.h,
                      maxExtent: showSheet == false ? 0.h : 400.h,
                      initialExtent: showSheet == false ? 0.h : 400.h,
                      minExtent: showSheet == false ? 0.h : 400.h,
                      maxExtent: showSheet == false ? 0.h : 400.h,
                      controller: sheetController,
                      fit: SheetFit.expand,
                      child: RideSelectionSheet(
                        travelTime: travelTime ?? "0.0",
                      ),
                    ),*/
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
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);
    DropLocationModel dropModel =
        DropLocationModel.fromMap(homeBloc.dropLocationMap);
    final Uint8List? markerIDOne =
        await getBytesFromAsset(AppAssets.pickPin, (100.h).toInt());
    final Uint8List? markerIDTwo =
        await getBytesFromAsset(AppAssets.dropPin, (100.h).toInt());
    /*if (pickModel.lat != 0.0 && dropModel.lat != 0.0) {
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
    }*/
    if (homeBloc.dropLocationMap["lat"] != null) {
      setState(() async {
        markers.add(
          Marker(
            markerId: const MarkerId("id-1"),
            icon: BitmapDescriptor.fromBytes(markerIDOne!),
            position: LatLng(homeBloc.pickLocationMap["lat"]!,
                homeBloc.pickLocationMap["lng"]!),
          ),
        );

        markers.add(
          Marker(
            markerId: const MarkerId("id-2"),
            icon: BitmapDescriptor.fromBytes(markerIDTwo!),
            position: LatLng(homeBloc.dropLocationMap["lat"],
                homeBloc.dropLocationMap["lng"]),
          ),
        );
        if (a == 0) {
          Future.delayed(const Duration(seconds: 1), () {
            setPolyLines();
          });
          a = a + 1;
        }
      });
    }
  }

  Future<void> setPolyLines() async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);
    DropLocationModel dropModel =
        DropLocationModel.fromMap(homeBloc.dropLocationMap);
    setState(() {
      animatedCoordinates.clear();
      polylineCoordinates.clear();
      polyLines.clear();
    });
    polylinePoints = PolylinePoints();
    if (myTimer?.isActive != true) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          homeBloc.apiKey,
          PointLatLng(pickModel.lat!, pickModel.lng!),
          PointLatLng(dropModel.lat!, dropModel.lng!));
      if (result.status == "OK") {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          //zoomPoly();
        }

        int i = 0;
        if (myTimer?.isActive != true) {
          myTimer = Timer.periodic(const Duration(microseconds: 1000), (timer) {
            if (i <= polylineCoordinates.length) {
              setState(() {
                animatedCoordinates.add(polylineCoordinates[i]);
                polyLines.add(Polyline(
                  width: 3,
                  visible: true,
                  polylineId: const PolylineId("polyLine"),
                  color: Theme.of(context).primaryColor,
                  points: animatedCoordinates,
                ));
                i = i + 1;
                if (i == polylineCoordinates.length) {
                  zoomPoly();
                }
              });
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

  zoomPoly() async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    List<LatLng> zoomCoordinates = [];
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);
    DropLocationModel dropModel =
        DropLocationModel.fromMap(homeBloc.dropLocationMap);
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        homeBloc.apiKey,
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
      setState(() {
        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: zoomCoordinates[b],
              zoom: 12.0,
            ),
          ),
        );
      });
    }
  }

  centerButton() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);
    setState(() {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(pickModel.lat!, pickModel.lng!),
            zoom: 19.0,
          ),
        ),
      );
    });
  }

  getIndex(int index){
    return index;
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
