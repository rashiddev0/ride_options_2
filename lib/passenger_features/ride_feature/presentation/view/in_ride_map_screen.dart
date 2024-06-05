import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/const/export.dart';
import '../../../home_feature/data/models/location.dart';
import '../../../home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import '../../../home_feature/presentation/bloc/homeBloc/home_state.dart';
import '../../../home_feature/presentation/view/location_map_screen.dart';
import '../bloc/in_ride_map_bloc/in_ride_map_bloc.dart';
import 'components/driver_deatail_sheet.dart';

class InRideMap extends StatelessWidget {
  const InRideMap({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final inRideMapBloc = BlocProvider.of<InRideMapBloc>(context);
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
                bottom: 100.h,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) async {
                    inRideMapBloc.controllerCompleter.complete(controller);
                    inRideMapBloc.controller = controller;
                    inRideMapBloc.markers.clear();
                    final Uint8List? markerIDOne = await getBytesFromAsset(
                        AppAssets.pickPin,
                        (100.h).toInt());
                    if(pickLocation.lat != null){
                      inRideMapBloc.markers.add(
                          Marker(
                            markerId: const MarkerId("id-1"),
                            icon: BitmapDescriptor.fromBytes(markerIDOne!),
                            position: LatLng(pickLocation.lat!,
                                pickLocation.lng!),
                          ),
                        );
                    }
                  },
                  markers: inRideMapBloc.markers,
                  //polylines: polyLines.isEmpty ? {} : <Polyline>{polyLines.last},
                  buildingsEnabled: false,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(pickLocation.lat!, pickLocation.lng!),
                    zoom: 16,
                  ),

                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: .2,
                minChildSize: .2,
                maxChildSize: .2,
                builder: (BuildContext context, scrollSheetController) {
                  return DriverDetailsSheet(scrollController: scrollSheetController,);
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
}
