import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_options_2/passenger_features/bloc_test/test_map/test_map_state.dart';
import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';

import '../../../common/const/assets.dart';
import '../../home_feature/data/models/dropLocation.dart';
import '../../home_feature/data/models/location.dart';
import '../../home_feature/presentation/view/components/ride_selection_sheet.dart';
import 'test_map_bloc.dart';
import 'test_map_event.dart';

class TestMap extends StatelessWidget {
  const TestMap({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocProvider(
      create: (BuildContext context) => TestMapBloc()
        ..add(SetPickMarkerEvent(locationMap: homeBloc.pickLocationMap)),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TestMapBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);

    DropLocationModel dropModel =
        DropLocationModel.fromMap(homeBloc.dropLocationMap);
    return BlocConsumer<TestMapBloc, TestMapState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                top: 0.h,
                left: 0.w,
                right: 0.w,
                bottom: 415.h,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    bloc.controllerCompleter.complete(controller);
                    bloc.mapController = controller;
                    LocationModel pickModel =
                        LocationModel.fromMap(homeBloc.pickLocationMap);

                    DropLocationModel dropModel =
                        DropLocationModel.fromMap(homeBloc.dropLocationMap);
                    log("😊😊😊52😊😊😊$pickModel");
                    log("😊😊😊55😊😊😊$dropModel");
                  },
                  markers: bloc.markers,
                  polylines: bloc.polyLines.isEmpty ? {} : bloc.polyLines,
                  buildingsEnabled: false,
                  liteModeEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: MapType.terrain,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(pickModel.lat!, pickModel.lng!),
                    zoom: 16,
                  ),
                ),
              ),
              Positioned(
                // top: homeBloc.dropLocationController.text.isNotEmpty ? 380.h : 650.h,
                top: homeBloc.dropLocationController.text.isNotEmpty
                    ? 350.h
                    : 350.h,
                left: 291.w,
                child: InkWell(
                  onTap: () {
                    //centerButton();
                  },
                  child: Container(
                    height: 62.h,
                    width: 62.w,
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                initialChildSize: .5,
                minChildSize: .5,
                maxChildSize: .5,
                builder: (BuildContext context, scrollSheetController) {
                  return RideSelectionSheet(
                    scrollController: scrollSheetController,
                    travelTime: "0.0",
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
