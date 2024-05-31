import 'package:flutter_svg/svg.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_toggle_button.dart';
import 'package:ride_options_2/common_features/drawer/presentation/view/drawer.dart';
import 'package:ride_options_2/driver_features/home/presentation/view/activity_screen.dart';
import 'package:ride_options_2/driver_features/home/presentation/view/notifications_screen.dart';
import 'package:ride_options_2/driver_features/home/presentation/view/ride_requests_screen.dart';
import 'package:ride_options_2/driver_features/home/presentation/view/wallet_screen.dart';

class DriverNavBar extends StatefulWidget {
  const DriverNavBar({super.key});

  @override
  State<DriverNavBar> createState() => _DriverNavBarState();
}

class _DriverNavBarState extends State<DriverNavBar> {
  int _currentIndex = 0;

  bool activeStatus = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
          bgColor: AppColors.primary,
          title: CustomToggle(
              showOnline: true,
              values: [
                AppLocalizations.of(context)!.offline,
                AppLocalizations.of(context)!.online
              ],
              onToggleCallback: (value) {}),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const <Widget>[
            RideRequestScreen(),
            ActivityScreen(),
            WalletScreen(),
            NotificationsScreen()
          ],
        ),
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(milliseconds: 1000),
          elevation: 0,
          onDestinationSelected: (int index) {
            setState(() => _currentIndex = index);
          },
          indicatorColor: secondaryColor,
          selectedIndex: _currentIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.rideRequest,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.rideRequest,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
              ),
              label: AppLocalizations.of(context)!.requests,
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.activity,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.activity,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
              ),
              label: AppLocalizations.of(context)!.activity,
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.wallet,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.wallet,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
              ),
              label: AppLocalizations.of(context)!.wallet,
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.notifications,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                width: 68.w,
                height: 34.h,
                AppAssets.notifications,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
              ),
              label: AppLocalizations.of(context)!.notifications,
            ),
          ],
        ),
      ),
    );
  }
}
