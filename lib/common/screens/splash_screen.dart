import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../routes/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Lottie.asset('assets/lottie/splash.json',
            fit: BoxFit.fill, repeat: false,onLoaded: navigate(context)),
      ),
    );
  }
  navigate(BuildContext context){
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.onboardingOne, (route) => false);
    });
  }
}
