import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/passenger_features/home_feature/data/models/location.dart';
import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';

class LoadMap extends StatelessWidget {
  const LoadMap({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    LocationModel pickModel = LocationModel.fromMap(homeBloc.pickLocationMap);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) async {
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoute.locationMapScreen, (route) => false);
                });
              },
              buildingsEnabled: false,
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
        ],
      ),
    );
  }
}
