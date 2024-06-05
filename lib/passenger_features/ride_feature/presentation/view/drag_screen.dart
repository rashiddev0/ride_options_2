import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/const/export.dart';
import '../../../../../common/custom_widgets/custom_button.dart';
import '../../../home_feature/data/models/dropLocation.dart';
import '../../../home_feature/data/models/location.dart';
import '../../../home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import '../../../home_feature/presentation/bloc/homeBloc/home_state.dart';

class DragScreen extends StatelessWidget {
  const DragScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickLocation =
        LocationModel.fromMap(homeBloc.pickLocationMap);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.chooseOne,
        ),
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
                        //markers: homeBloc.markers,
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
                          homeBloc.hideButton(true);
                          //pick current location
                            homeBloc.centerLocation = position.target;
                        },
                        onCameraIdle: () async {
                          if(homeBloc.pickLocationTextController == true){
                            LocationModel pickLocationModel = LocationModel();
                            await homeBloc.getCurrentAddress(homeBloc.centerLocation.latitude, homeBloc.centerLocation.longitude, pickLocationModel);
                            homeBloc.hideButton(false);
                          }
                          else if(homeBloc.pickLocationTextController == false){
                            DropLocationModel dropLocationModel = DropLocationModel();
                            await homeBloc.getDropAddress(homeBloc.centerLocation.latitude, homeBloc.centerLocation.longitude, dropLocationModel);
                            homeBloc.hideButton(false);
                          }
                        },
                        //onTap: _handleTap,
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: size.width * 0.03,
                        bottom: size.height * 0.04,
                        child: Container(
                            height: size.height * 1,
                            width: size.width * 1,
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppAssets.icPin,
                              height: size.height * 0.08,
                              width: size.width * 0.08,
                            ))),
                    Positioned(
                        top: size.height * 0.8,
                        left: size.width * 0.02,
                        right: size.width * 0.02,
                        bottom: size.height * 0.01,
                        child: Visibility(
                          visible: state is HideButton && state.hideButton == true ? false : true,
                          //visible: true,
                          child: CustomButton(
                            title: AppLocalizations.of(context)!.done,
                            onTap: () {
                              //_returnSelectedLocation();
                              /*if(homeBloc.pickLocationTextController == false){
                                homeBloc.markerSetDrop();
                              }*/
                              Navigator.pushNamed(context, AppRoute.locationMapScreen);
                            },
                            borderColor: Theme.of(context).primaryColor,
                          ),
                        ))
                  ],
                );
              },
            )
          : const Center(
              child: Text("Loading"),
            ),
      /*floatingActionButton: homeBloc.selectedLocation != null
          ? FloatingActionButton(

        backgroundColor: primaryColor,

        onPressed: () {
          _returnSelectedLocation();
        },
        child: const Icon(Icons.check,color: whiteColor,),
      )
          : null,*/
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            homeBloc.moveCamera(pickLocation.lat!, pickLocation.lng!);
          },
          child: const Icon(
            Icons.location_searching_outlined,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
