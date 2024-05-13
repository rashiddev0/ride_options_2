import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/auth/account_type/account_type.dart';
import 'package:ride_options_2/common/onboarding/onboard_one.dart';
import 'package:ride_options_2/common/splash_screen/splash_screen.dart';

class AppRoute {
  static const splashScreen = '/splash_screen';
  static const onboardingOne = '/onboard_one';
  static const accountType = '/account_type';

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

      default:
        return null;
    }
  }
}
