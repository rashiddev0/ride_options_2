import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/ride_selection_sheet.dart';

import '../../../../../common/const/export.dart';
import '../../../data/models/location.dart';
import '../../bloc/homeBloc/home_bloc.dart';
import '../../bloc/homeBloc/home_state.dart';

class LocationMapScreen extends StatelessWidget {
  const LocationMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickLocation =
    LocationModel.fromMap(homeBloc.pickLocationMap);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //bottomSheet: const RideSelectionSheet(),
      /*bottomSheet: DraggableScrollableSheet(
        initialChildSize: 0.130,
        minChildSize: 0.130,
        maxChildSize: 0.5,
        builder: (BuildContext context, scrollSheetController) {
          return const RideSelectionSheet();
        },
      ),*/
      body: pickLocation.lat != null
          ? BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    homeBloc.controllerCompleter.complete(controller);
                    homeBloc.controller = controller;
                  },
                  markers: homeBloc.markers,
                  buildingsEnabled: false,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: MapType.terrain,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(pickLocation.lat!, pickLocation.lng!),
                    zoom: 16,
                  ),
                  onCameraMove: (CameraPosition position) {
                    homeBloc.selectedLocation = false;
                    //pick current location
                    /*setState(() {
                  _centerLocation = position.target;
                });*/
                  },
                  onCameraIdle: () {
                    homeBloc.selectedLocation = true;
                    // _handleTap(_centerLocation);
                  },
                  //onTap: _handleTap,
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.12,
                minChildSize: 0.12,
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
}
