import 'package:ride_options_2/common/const/export.dart';
import '../../data/models/vehicle_models.dart';
import '../component/vehicle_type_container.dart';

class VehicleTypeScreen extends StatelessWidget {
   VehicleTypeScreen({super.key});



   List<VehicleModel> _getVehicleList(BuildContext context) {
     return [
       VehicleModel(
         image: AppAssets.rides,
         info: 'Rides',
         name: AppLocalizations.of(context)!.rides,
         description:  AppLocalizations.of(context)!.bikeRikshawCarTextDescription,
       ),
       VehicleModel(
         image: AppAssets.freight,
         info: 'Freight',
         name: AppLocalizations.of(context)!.freight,
         description: AppLocalizations.of(context)!.ridesFreightDescription,
       ),
     ];
   }


  @override
  Widget build(BuildContext context) {
    List<VehicleModel> vehicle = _getVehicleList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.type,
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

                  if(vehicle[index].name=="Rides"){
                    Navigator.pushNamed(context, AppRoute.vehicleRideTypeScreen,);
                  }else{
                    Navigator.pushNamed(context, AppRoute.vehicleFrightTypeScreen,);
                  }

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
