import '../../../../common/const/export.dart';
import '../../../../common_features/drawer/presentation/components/drawer_tile.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.about_us,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: ListView(
            children: [
              DrawerTile(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoute.privacyPolicyScreen),
                icon: AppAssets.history,
                title: AppLocalizations.of(context)!.privacy_policy,
              ),
              addHeight(16.h),
              DrawerTile(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoute.termsOfServices),
                icon: AppAssets.termsOfService,
                title: AppLocalizations.of(context)!.termsOfService,
              ),
              addHeight(16.h),
              DrawerTile(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoute.complainScreen),
                icon: AppAssets.complain,
                title: AppLocalizations.of(context)!.complain,
              ),
              addHeight(16.h),
              DrawerTile(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoute.contactUsScreen),
                icon: AppAssets.contactUs,
                title: AppLocalizations.of(context)!.contact_us,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
