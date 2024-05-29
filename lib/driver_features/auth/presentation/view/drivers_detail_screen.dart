import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';

import '../component/driver_details_tile.dart';

class DriversDetailScreen extends StatelessWidget {
  const DriversDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.driver_details,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Column(
            children: [
              DriverDetailTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.basicInfoScreen,
                  );
                },
                title: AppLocalizations.of(context)!.basic_info,
                icon2: "",
                icon: AppAssets.arrowForward,
              ),
              DriverDetailTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.cNICScreen,
                  );
                },
                title: AppLocalizations.of(context)!.cnic,
                icon2: "",
                icon: AppAssets.arrowForward,
              ),
              DriverDetailTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.licenseScreen,
                  );
                },
                title: AppLocalizations.of(context)!.driving_license,
                icon2: "",
                icon: AppAssets.arrowForward,
              ),
              DriverDetailTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.vehicleInfoScreen,
                  );
                },
                title: AppLocalizations.of(context)!.vehicle_info,
                icon2: "",
                icon: AppAssets.arrowForward,
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: null,
                  child: Text(
                    AppLocalizations.of(context)!.save,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              addHeight(59.h),
              Text(
                AppLocalizations.of(context)!.agree_terms,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              addHeight(59.h)
            ],
          ),
        ),
      ),
    );
  }
}
