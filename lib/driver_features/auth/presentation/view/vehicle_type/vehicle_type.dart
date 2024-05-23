import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/internet_check/cubit/internet_cubit.dart';
import 'package:ride_options_2/driver_features/auth/presentation/view/vehicle_type/component/vehicle_type_container.dart';

class VehicleType extends StatelessWidget {
  const VehicleType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor:
                  state == InternetState.Gained ? Colors.white : Colors.red,
              title: state == InternetState.Gained
                  ? Text(
                      AppLocalizations.of(context)!.selectOne,
                    )
                  : Text(
                      "Internet not connected!",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 27.h),
              child: Column(
                children: [
                  VehicleTypeContainer(
                    title: "اردو",
                    icon: AppAssets.bike,
                    desc: "اردو",
                    onTap: () {},
                  ),
                  addHeight(24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
