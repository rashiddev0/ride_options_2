import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import '../../data/models/vehicle_models.dart';
import '../component/vehicle_type_container.dart';

class VehicleFreightTypeScreen extends StatelessWidget {
  const VehicleFreightTypeScreen({super.key});

  List<VehicleModel> _getVehicleList(BuildContext context) {
    return [
      VehicleModel(
        image: AppAssets.loaderRickshaw,
        info: '',
        name: AppLocalizations.of(context)!.loaderRikshaw,
        description: AppLocalizations.of(context)!.bikeDescription,
        width: 84.w,
        height: 44.26.h,
      ),
      VehicleModel(
        image: AppAssets.freight,
        info: '',
        name: AppLocalizations.of(context)!.truckSmall,
        description: AppLocalizations.of(context)!.truckSmallDescription,
        width: 88.w,
        height: 44.39.h,
      ),
      VehicleModel(
        image: AppAssets.freight,
        info: '',
        name: AppLocalizations.of(context)!.truckMedium,
        description: AppLocalizations.of(context)!.truckMediumDescription,
        width: 88.w,
        height: 44.39.h,
      ),
      VehicleModel(
        image: AppAssets.freight,
        info: '',
        name: AppLocalizations.of(context)!.truckLarge,
        description: AppLocalizations.of(context)!.truckLargeDescription,
        width: 88.w,
        height: 44.39.h,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<VehicleModel> vehicle = _getVehicleList(context);
    return Scaffold(
      appBar: CustomAppBar(
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
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return VehicleTypeContainer(
                title: vehicle[index].name,
                icon: vehicle[index].image,
                desc: vehicle[index].description,
                width: vehicle[index].width,
                height: vehicle[index].height,
                onTap: () {},
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
