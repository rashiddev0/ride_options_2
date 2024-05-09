import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/screens/splash_screen.dart';

class AppRoute {
  static const splashScreen = '/splash_screen';

  static Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
