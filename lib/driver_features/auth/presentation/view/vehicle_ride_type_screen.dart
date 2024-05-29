import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import '../../data/models/vehicle_models.dart';
import '../component/vehicle_type_container.dart';

class VehicleRideTypeScreen extends StatelessWidget {
  const VehicleRideTypeScreen({super.key});

  List<VehicleModel> _getVehicleList(BuildContext context) {
    return [
      VehicleModel(
        image: AppAssets.bike,
        info: '',
        name: AppLocalizations.of(context)!.bike,
        description: AppLocalizations.of(context)!.bikeDescription,
        width: 88.w,
        height: 52.31.h,
      ),
      VehicleModel(
        image: AppAssets.auto,
        info: '',
        name: AppLocalizations.of(context)!.auto,
        description: AppLocalizations.of(context)!.autoDescription,
        width: 86.w,
        height: 53.h,
      ),
      VehicleModel(
        image: AppAssets.car,
        info: '',
        name: AppLocalizations.of(context)!.car,
        description: AppLocalizations.of(context)!.carDescription,
        width: 88.w,
        height: 36.h,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<VehicleModel> vehicle = _getVehicleList(context);
    return Scaffold(
      appBar:
          CustomAppBar(title: Text(AppLocalizations.of(context)!.selectOne)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return VehicleTypeContainer(
                title: vehicle[index].name,
                icon: vehicle[index].image,
                desc: vehicle[index].description,
                width: vehicle[index].width,
                height: vehicle[index].height,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.driversDetailScreen,
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return addHeight(16.h);
            },
            itemCount: vehicle.length,
          ),
        ),
      ),
    );
  }
}
