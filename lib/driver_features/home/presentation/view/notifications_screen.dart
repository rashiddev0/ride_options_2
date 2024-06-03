import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/drawer/presentation/view/drawer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      // this appbar for driver
      appBar: CustomAppBar(
          height: 70.h,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: SvgPicture.asset(
                  AppAssets.drawerIcon,
                  width: 28.w,
                  height: 28.h,
                  colorFilter:
                      ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          action: [
            SvgPicture.asset(
              AppAssets.appbarSetting,
              width: 28.w,
              height: 28.h,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            addWidth(16.w),
          ],
          bgColor: Theme.of(context).colorScheme.primary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.wallet,
                width: 30.w,
                height: 30.h,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onInverseSurface,
                    BlendMode.srcIn),
              ),
              addWidth(8.w),
              Text(
                '0',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              )
            ],
          )),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            AppAssets.notificationsScreen,
            width: 150.w,
            height: 150.h,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
          ),
          addHeight(24.h),
          Text(
            'No notifications yet!',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ]),
      ),
    );
  }
}
