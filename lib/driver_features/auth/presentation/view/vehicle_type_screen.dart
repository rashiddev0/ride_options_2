import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import 'package:ride_options_2/common_features/internet_check/cubit/internet_cubit.dart';

import '../../data/models/vehicle_models.dart';
import '../component/vehicle_type_container.dart';

class VehicleTypeScreen extends StatelessWidget {
  const VehicleTypeScreen({super.key});

  List<VehicleModel> _getVehicleList(BuildContext context) {
    return [
      VehicleModel(
        image: AppAssets.rides,
        info: 'Rides',
        name: AppLocalizations.of(context)!.rides,
        description:
            AppLocalizations.of(context)!.bikeRikshawCarTextDescription,
        width: 113.37.w,
        height: 63.46.h,
      ),
      VehicleModel(
        image: AppAssets.freight,
        info: 'Freight',
        name: AppLocalizations.of(context)!.freight,
        description: AppLocalizations.of(context)!.ridesFreightDescription,
        width: 88.w,
        height: 44.39.h,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // final internetCubit = BlocProvider.of<InternetCubit>(context);
    List<VehicleModel> vehicle = _getVehicleList(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context)!.type),
      ),

      // this appbar for driver
      // CustomAppBar(
      //   height: 70.h,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: SvgPicture.asset(
      //           AppAssets.drawerIcon,
      //           width: 28.w,
      //           height: 28.h,
      //           colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      //         ),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       );
      //     },
      //   ),
      //   action: [
      //     SvgPicture.asset(
      //       AppAssets.appbarSetting,
      //       width: 28.w,
      //       height: 28.h,
      //       colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      //     ),
      //     addWidth(16.w),
      //   ],
      //   bgColor: AppColors.primary,
      //   title: CustomToggle(
      //       showOnline: true,
      //       values: const ['Offline', 'Online'],
      //       onToggleCallback: (value) {}),
      // ),
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
                  if (vehicle[index].name ==
                      AppLocalizations.of(context)!.rides) {
                    Navigator.pushNamed(
                      context,
                      AppRoute.vehicleRideTypeScreen,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      AppRoute.vehicleFrightTypeScreen,
                    );
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
