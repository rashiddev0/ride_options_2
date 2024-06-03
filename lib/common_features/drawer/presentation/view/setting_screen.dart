import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/drawer/presentation/components/drawer_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
            title: Text(
          AppLocalizations.of(context)!.settings,
        )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              addHeight(24.h),
              DrawerTile(
                  onTap: () {},
                  icon: AppAssets.notification,
                  text: "On",
                  title: AppLocalizations.of(context)!.notifications),
              addHeight(8.h),
              DrawerTile(
                  text: 'English',
                  onTap: () {},
                  icon: AppAssets.language,
                  title: AppLocalizations.of(context)!.language),
              addHeight(8.h),
              DrawerTile(
                  text: 'Lahore',
                  onTap: () {},
                  icon: AppAssets.locationPin,
                  title: AppLocalizations.of(context)!.citySelection),
              addHeight(8.h),
              DrawerTile(
                  text: 'System',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoute.themeScreen),
                  icon: AppAssets.theme,
                  title: AppLocalizations.of(context)!.theme),
              addHeight(8.h),
              DrawerTile(
                  text: 'Google',
                  onTap: () {},
                  icon: AppAssets.navigator,
                  title: AppLocalizations.of(context)!.navigator),
              addHeight(8.h),
              DrawerTile(
                  onTap: () {},
                  icon: AppAssets.rate,
                  title: AppLocalizations.of(context)!.rateThisApp),
              addHeight(8.h),
              DrawerTile(
                  onTap: () {},
                  icon: AppAssets.help,
                  title: AppLocalizations.of(context)!.help),
              addHeight(8.h),
              DrawerTile(
                  onTap: () {},
                  icon: AppAssets.delete,
                  title: AppLocalizations.of(context)!.deleteAccount),
              addHeight(8.h),
            ],
          ),
        ),
      ),
    );
  }
}
