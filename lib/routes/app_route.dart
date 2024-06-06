import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/auth/presentation/view/account_type/account_type.dart';
import 'package:ride_options_2/common_features/auth/presentation/view/otp/otp_screen.dart';
import 'package:ride_options_2/common_features/drawer/presentation/view/setting_screen.dart';
import 'package:ride_options_2/common_features/drawer/presentation/view/theme_screen.dart';
import 'package:ride_options_2/common_features/onboarding/onboard_one.dart';
import 'package:ride_options_2/common_features/splash_screen/splash_screen.dart';
import 'package:ride_options_2/driver_features/about_us/presentation/view/about_us_screen.dart';
import 'package:ride_options_2/driver_features/about_us/presentation/view/complain_screen.dart';
import 'package:ride_options_2/driver_features/about_us/presentation/view/contacts_us_screen.dart';
import 'package:ride_options_2/driver_features/about_us/presentation/view/privacy_policy_screen.dart';
import 'package:ride_options_2/driver_features/about_us/presentation/view/terms_of_service_screen.dart';
import 'package:ride_options_2/driver_features/auth/presentation/view/vehicle_type_screen.dart';
import 'package:ride_options_2/driver_features/history/presentation/view/history_screen.dart';
import 'package:ride_options_2/driver_features/home/presentation/view/driver_bottom_navbar.dart';
import 'package:ride_options_2/driver_features/wallet/presentation/view/referral_wallet_screen.dart';

import '../common_features/auth/presentation/view/number/number_screen.dart';
import '../passenger_features/home_feature/presentation/view/courier_screen.dart';
import '../passenger_features/home_feature/presentation/view/drag_screen.dart';
import '../passenger_features/home_feature/presentation/view/home_screen.dart';
import '../passenger_features/home_feature/presentation/view/location_map_screen.dart';
import '../passenger_features/ride_feature/presentation/view/components/ride_cancel_screen.dart';
import '../driver_features/auth/presentation/view/basic_info_screen.dart';
import '../driver_features/auth/presentation/view/cnic_screen.dart';
import '../driver_features/auth/presentation/view/drivers_detail_screen.dart';
import '../driver_features/auth/presentation/view/license_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_fright_type_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_info_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_photo_screen.dart';
import '../driver_features/auth/presentation/view/vehicle_ride_type_screen.dart';
import '../driver_features/favorites/presentation/view/favorites_screen.dart';
import '../passenger_features/ride_feature/presentation/view/in_ride_map_screen.dart';

class AppRoute {
  static const splashScreen = '/splash_screen';
  static const onboardingOne = '/onboard_one';
  static const accountType = '/account_type';
  static const numberScreen = '/number_screen';
  static const otpScreen = '/otp';
  static const vehicleType = '/vehicle_type';
  static const passengerHome = '/home_screen';
  static const dragMarkerScreen = '/drag_screen';
  static const locationMapScreen = '/location_map_screen';
  static const inRideMap = '/in_ride_map_screen';
  static const rideCancelScreen = '/ride_cancel_screen';
  static const courierScreen = '/courier_screen';
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

  static const favouritesScreen = '/FavouritesScreen';
  static const historyScreen = '/HistoryScreen';
  static const aboutUsPage = '/AboutUsPage';
  static const privacyPolicyScreen = '/PrivacyPolicyScreen';

  static const termsOfServices = '/TermsOfServices';

  static const contactUsScreen = '/ContactUsScreen';

  static const complainScreen = '/complainScreen';
  static const walletScreen = '/WalletScreen';
  static const referralWalletScreen = '/ReferralWalletScreen';

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
          builder: (_) => BasicInfoScreen(),
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

      case favouritesScreen:
        return MaterialPageRoute(
          builder: (_) => FavouritesScreen(),
          settings: settings,
        );

      case historyScreen:
        return MaterialPageRoute(
          builder: (_) => HistoryScreen(),
          settings: settings,
        );

      case passengerHome:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case dragMarkerScreen:
        return MaterialPageRoute(
          builder: (_) => const DragScreen(),
          settings: settings,
        );

      case locationMapScreen:
        return MaterialPageRoute(
          builder: (_) => const LocationMapScreen(),
          settings: settings,
        );

      case inRideMap:
        return MaterialPageRoute(
          builder: (_) => const InRideMap(),
          settings: settings,
        );
      case rideCancelScreen:
        return MaterialPageRoute(
          builder: (_) => const RideCancelScreen(),
          settings: settings,
        );

      case courierScreen:
        return MaterialPageRoute(
          builder: (_) => const CourierScreen(),
          settings: settings,
        );
      case aboutUsPage:
        return MaterialPageRoute(
          builder: (_) => const AboutUsPage(),
          settings: settings,
        );
      case privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyScreen(),
          settings: settings,
        );
      case termsOfServices:
        return MaterialPageRoute(
          builder: (_) => const TermsOfServices(),
          settings: settings,
        );
      case complainScreen:
        return MaterialPageRoute(
          builder: (_) => ComplainScreen(),
          settings: settings,
        );
      case contactUsScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
          settings: settings,
        );
      case referralWalletScreen:
        return MaterialPageRoute(
          builder: (_) => const ReferralWalletScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
