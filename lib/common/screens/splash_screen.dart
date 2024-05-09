import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 361.w,
            height: 57.h,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Click Me",
                ))),
      ),
    );
  }
}
