import 'package:ride_options_2/common/const/export.dart';

import '../../component/vehicle_type_container.dart';

class VehicleType extends StatelessWidget {
  const VehicleType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.chooseOne,
        ),
      ),
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
                width: 200.w,
                height: 200.w,
              ),
              addHeight(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
