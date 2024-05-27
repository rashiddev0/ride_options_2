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
    /*int? a = 0;
    if(a == 0){
      openBottomSheet(context);
      a = a+1;
    }*/
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickLocation =
    LocationModel.fromMap(homeBloc.pickLocationMap);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //bottomSheet: const RideSelectionSheet(),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: 0.5,

        minChildSize: 0.5,
        maxChildSize: 0.5,
        builder: (BuildContext context, scrollSheetController) {
          return const RideSelectionSheet();
        },
      ),
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
            ],
          );
        },
      )
          : const Center(
        child: Text("Loading"),
      ),
    );
  }
  openBottomSheet(BuildContext context){
    Future.delayed(const Duration(milliseconds: 500),(){
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          builder: (BuildContext context) {
            return const RideSelectionSheet();
          });
    });
  }
}
