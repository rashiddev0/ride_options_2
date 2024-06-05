import 'package:ride_options_2/common_features/auth/presentation/view/otp/otp_screen.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/auth/presentation/view/account_type/account_type.dart';
import 'package:ride_options_2/common_features/onboarding/onboard_one.dart';
import 'package:ride_options_2/common_features/splash_screen/splash_screen.dart';
import 'package:ride_options_2/driver_features/auth/presentation/view/vehicle_type/vehicle_type.dart';
import '../common_features/auth/presentation/view/number/number_screen.dart';
import '../passenger_features/home_feature/presentation/view/courier_screen.dart';
import '../passenger_features/home_feature/presentation/view/drag_screen.dart';
import '../passenger_features/home_feature/presentation/view/home_screen.dart';
import '../passenger_features/home_feature/presentation/view/in_ride_map_screen.dart';
import '../passenger_features/home_feature/presentation/view/location_map_screen.dart';
import '../passenger_features/ride_feature/presentation/view/components/ride_cancel_screen.dart';


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
      case vehicleType:
        return MaterialPageRoute(
          builder: (_) => const VehicleType(),
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


      default:
        return null;
    }
  }
}
