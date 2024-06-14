import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_options_2/driver_features/in_ride/presentation/bloc/driver_inride_state.dart';

import '../../../../common/const/export.dart';
import '../../../../passenger_features/home_feature/data/models/location.dart';
import '../../../../passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import '../bloc/driver_inride_bloc.dart';
import '../bloc/driver_inride_event.dart';
import 'component/driver_ride_detail_sheet.dart';

class DriverInRideScreen extends StatelessWidget {
  const DriverInRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final dInRideBloc = BlocProvider.of<DriverInRideBloc>(context);
    return BlocProvider(
      create: (BuildContext context) => DriverInRideBloc()
        ..add(MarkerSetEvent(
          driPinMap: homeBloc.pickLocationMap,
          pickLocMap: dInRideBloc.pickLocation,
          apiKey: homeBloc.apiKey,
          //color: Theme.of(context).primaryColor
        )),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final dInRideBloc = BlocProvider.of<DriverInRideBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);
    LocationModel dropModel = LocationModel.fromMap(dInRideBloc.pickLocation);

    return BlocConsumer<DriverInRideBloc, DriverInRideState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    dInRideBloc.controllerCompleter.complete(controller);
                    dInRideBloc.mapController = controller;
                    Future.delayed(const Duration(seconds: 3), () {
                      if (dInRideBloc.polylineCoordinates.isNotEmpty) {
                        dInRideBloc.add(SetPolyLineEvent());
                      }
                    });
                  },
                  markers: dInRideBloc.markers,
                  polylines: dInRideBloc.polyLines.isEmpty
                      ? {}
                      : dInRideBloc.polyLines,
                  buildingsEnabled: false,
                  liteModeEnabled: false,
                  myLocationEnabled: true,
                  zoomControlsEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.terrain,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(pickModel.lat!, pickModel.lng!),
                    zoom: 16,
                  ),
                ),
              ),
              Positioned(
                left: 0.w,
                right: 0.w,
                bottom: 0.h,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: 150.h,
                    child: Column(
                      children: [
                        addHeight(6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 62.h,
                                width: 62.w,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(100.r),
                                  // border: Border.all(
                                  //     width: 3.w,
                                  //     color: Theme.of(context).primaryColor)
                                ),
                                child: InkWell(
                                  onTap: () {
                                    /*showModalBottomSheet(
                                        context: context,
                                        //isScrollControlled: true,
                                        enableDrag: true,
                                        useSafeArea: true,
                                        backgroundColor:
                                        Theme.of(context).scaffoldBackgroundColor,
                                        builder: (BuildContext context) {
                                          return const SaftyOptionSheet();
                                        });*/
                                  },
                                  child: Icon(
                                    Icons.comment,
                                    color: Theme.of(context).primaryColor,
                                    size: 21.h,
                                  ),
                                )),
                            Container(
                                height: 62.h,
                                width: 62.w,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(100.r),
                                  // border: Border.all(
                                  //     width: 3.w,
                                  //     color: Theme.of(context).primaryColor)
                                ),
                                child: Icon(
                                  Icons.call,
                                  color: Theme.of(context).primaryColor,
                                  size: 21.h,
                                )),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    //isScrollControlled: true,
                                    enableDrag: true,
                                    useSafeArea: true,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    builder: (BuildContext context) {
                                      return const DriverRideDetailSheet();
                                    });
                              },
                              child: Container(
                                height: 62.h,
                                width: 62.w,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(100.r),
                                  // border: Border.all(
                                  //     width: 3.w,
                                  //     color: Theme.of(context).primaryColor)
                                ),
                                child: Icon(
                                  Icons.more_vert,
                                  color: Theme.of(context).primaryColor,
                                  size: 21.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                        addHeight(10.h),
                        AnimatedToggleSwitch<bool>.dual(
                          current: false,
                          first: false,
                          second: true,
                          spacing: 100.0,
                          style: const ToggleStyle(
                            borderColor: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          borderWidth: 5.0,
                          height: 55,
                          onChanged: (b) => true,
                          styleBuilder: (b) => ToggleStyle(
                              indicatorColor: b
                                  ? Colors.green
                                  : Theme.of(context).primaryColor),
                          iconBuilder: (value) => value
                              ? const Icon(Icons.check)
                              : Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                          textBuilder: (value) => value
                              ? const Center(child: Text('Stated'))
                              : const Center(child: Text('Start Ride')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.w,
                bottom: 160.h,
                child: InkWell(
                  onTap: () {
                    //centerButton();
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.centerLocationIcon,
                          height: 22.5,
                          width: 22.5,
                        ),
                      ),
                      addWidth(60.w),
                      InkWell(
                          onTap: () {
                            dInRideBloc.openMap(
                                LatLng(pickModel.lat!, pickModel.lng!),
                                LatLng(dropModel.lat!, dropModel.lng!));
                          },
                          child: SvgPicture.asset(AppAssets.googleMapButton)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
