import 'package:ride_options_2/common/const/export.dart';
import '../../data/models/vehicle_models.dart';
import '../component/vehicle_type_container.dart';

class VehicleRideTypeScreen extends StatelessWidget {
  VehicleRideTypeScreen({super.key});



  List<VehicleModel> _getVehicleList(BuildContext context) {
    return [
      VehicleModel(
        image: AppAssets.bike,
        info: '',
        name: AppLocalizations.of(context)!.bike,
        description:  AppLocalizations.of(context)!.bikeDescription,
      ),

      VehicleModel(
        image: AppAssets.auto,
        info: '',
        name: AppLocalizations.of(context)!.auto,
        description: AppLocalizations.of(context)!.autoDescription,
      ),

      VehicleModel(
        image: AppAssets.car,
        info: '',
        name: AppLocalizations.of(context)!.car,
        description: AppLocalizations.of(context)!.carDescription,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    List<VehicleModel> vehicle = _getVehicleList(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)!.selectOne,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h,horizontal: 16.w),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return  VehicleTypeContainer(
                title: vehicle[index].name,
                icon: vehicle[index].image,
                desc: vehicle[index].description,
                onTap: () {


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
