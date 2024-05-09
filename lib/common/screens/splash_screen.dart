import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_options_2/common/cubits/theme/theme_cubit.dart';
import 'package:ride_options_2/common/cubits/theme/theme_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 361.w,
            height: 80.h,
            child: BlocConsumer<ThemeCubit, ThemeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ThemeCubit>(context).toggleTheme();
                    },
                    child: const Text(
                      "Click Me",
                    ));
              },
            )),
      ),
    );
  }
}
