import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_toggle_button.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';
import 'package:ride_options_2/common_features/drawer/presentation/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: ListView(
          padding:
              EdgeInsets.only(top: 60.h, bottom: 36.h, left: 16.w, right: 16.w),
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: () {},
              child: Ink(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                height: 94.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        // backgroundImage: NetworkImage(
                        //   "", // Use null-aware operator
                        // ),
                      ),
                    ),
                    addWidth(4.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ijaz Shalvi',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '0308-2770017',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
            addHeight(24.h),
            DrawerTile(
                onTap: () {},
                icon: AppAssets.locationPin,
                title: AppLocalizations.of(context)!.favorites),
            addHeight(8.h),
            DrawerTile(
                onTap: () {},
                icon: AppAssets.history,
                title: AppLocalizations.of(context)!.history),
            addHeight(8.h),
            DrawerTile(
                onTap: () {},
                icon: AppAssets.wallet,
                title: AppLocalizations.of(context)!.wallet),
            addHeight(8.h),
            DrawerTile(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoute.settingScreen),
                icon: AppAssets.setting,
                title: AppLocalizations.of(context)!.settings),
            addHeight(8.h),
            DrawerTile(
                onTap: () {},
                icon: AppAssets.about,
                title: AppLocalizations.of(context)!.aboutUs),
            addHeight(8.h),
            BlocBuilder<LocalizationCubit, Locale>(builder: (context, state) {
              return CustomToggle(
                values: const ['English', 'اردو'],
                initialPosition: state.toString() == 'ur' ? false : true,
                onToggleCallback: (value) {
                  if (value == 0) {
                    BlocProvider.of<LocalizationCubit>(context)
                        .setEnglishLocale();
                  } else if (value == 1) {
                    BlocProvider.of<LocalizationCubit>(context).setUrduLocale();
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
