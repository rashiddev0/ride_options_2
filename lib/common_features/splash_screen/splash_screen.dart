import 'package:lottie/lottie.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationCubit localizationCubit =
        BlocProvider.of<LocalizationCubit>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Lottie.asset('assets/lottie/splash.json',
            fit: BoxFit.fill, repeat: false, onLoaded: navigate(context)),
      ),
    );
  }

  navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      /*Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.onboardingOne, (route) => false);*/
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.passengerHome, (route) => false);
    });
  }
}
