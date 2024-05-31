import 'package:ride_options_2/common_features/auth/presentation/view/otp/otp_screen.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/auth/presentation/view/account_type/account_type.dart';
import 'package:ride_options_2/common_features/drawer/presentation/view/setting_screen.dart';
import 'package:ride_options_2/common_features/drawer/presentation/view/theme_screen.dart';
import 'package:ride_options_2/common_features/onboarding/onboard_one.dart';
import 'package:ride_options_2/common_features/splash_screen/splash_screen.dart';
import 'package:ride_options_2/driver_features/auth/presentation/view/vehicle_type_screen.dart';
import 'package:ride_options_2/driver_features/home/presentation/view/driver_bottom_navbar.dart';

import '../common_features/auth/presentation/view/number/number_screen.dart';
import '../driver_features/auth/presentation/view/basic_info_screen.dart';
import '../driver_features/auth/presentation/view/cnic_screen.dart';
import '../driver_features/auth/presentation/view/drivers_detail_screen.dart';
import '../driver_features/auth/presentation/view/license_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_fright_type_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_info_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_photo_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_ride_type_screen.dart';

class AppRoute {
  static const splashScreen = '/splash_screen';
  static const onboardingOne = '/onboard_one';
  static const accountType = '/account_type';
  static const numberScreen = '/number_screen';
  static const otpScreen = '/otp';
  static const settingScreen = '/setting_screen';
  static const themeScreen = '/theme_screen';

  ///*********** Driver Routes
  static const vehicleTypeScreen = '/vehicleTypeScreen';
  static const vehicleRideTypeScreen = '/vehicleRideTypeScreen';
  static const vehicleFrightTypeScreen = '/vehicleFrightTypeScreen';

  static const driversDetailScreen = '/driversDetailScreen';

  static const basicInfoScreen = '/basicInfoScreen';

  static const cNICScreen = '/CNICScreen';
  static const licenseScreen = '/LicenseScreen';
  static const vehicleInfoScreen = '/VehicleInfoScreen';
  static const vehiclePhotoScreen = '/VehiclePhotoScreen';
  static const drivrNavBar = '/driver_navbar';

  static Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case onboardingOne:
        return MaterialPageRoute(
          builder: (_) => const OnBoardOne(),
          settings: settings,
        );

      case accountType:
        return MaterialPageRoute(
          builder: (_) => const AccountType(),
          settings: settings,
        );

      case numberScreen:
        return MaterialPageRoute(
          builder: (_) => const NumberScreen(),
          settings: settings,
        );

      case otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OTPScreen(),
          settings: settings,
        );

      case vehicleTypeScreen:
        return MaterialPageRoute(
          builder: (_) => const VehicleTypeScreen(),
          settings: settings,
        );

      case vehicleRideTypeScreen:
        return MaterialPageRoute(
          builder: (_) => const VehicleRideTypeScreen(),
          settings: settings,
        );

      case vehicleFrightTypeScreen:
        return MaterialPageRoute(
          builder: (_) => const VehicleFreightTypeScreen(),
          settings: settings,
        );

      case driversDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const DriversDetailScreen(),
          settings: settings,
        );

      case basicInfoScreen:
        return MaterialPageRoute(
          builder: (_) => const BasicInfoScreen(),
          settings: settings,
        );
      case cNICScreen:
        return MaterialPageRoute(
          builder: (_) => CNICScreen(),
          settings: settings,
        );

      case licenseScreen:
        return MaterialPageRoute(
          builder: (_) => const LicenseScreen(),
          settings: settings,
        );

      case vehicleInfoScreen:
        return MaterialPageRoute(
          builder: (_) => VehicleInfoScreen(),
          settings: settings,
        );

      case vehiclePhotoScreen:
        return MaterialPageRoute(
          builder: (_) => VehiclePhotoScreen(),
          settings: settings,
        );
      case settingScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
          settings: settings,
        );
      case themeScreen:
        return MaterialPageRoute(
          builder: (_) => const ThemeScreen(),
          settings: settings,
        );
      case drivrNavBar:
        return MaterialPageRoute(
          builder: (_) => const DriverNavBar(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
