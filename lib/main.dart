import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_options_2/common/cubits/theme/theme_cubit.dart';
import 'package:ride_options_2/common/cubits/theme/theme_state.dart';
import 'package:ride_options_2/common/screens/splash_screen.dart';
import 'package:ride_options_2/common/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ThemeCubit()),
            ],
            child: BlocConsumer<ThemeCubit, ThemeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return MaterialApp(
                  title: 'Ride Options',
                  themeMode: ThemeMode.system,
                  theme: BlocProvider.of<ThemeCubit>(context).isDarkMode == true ?  darkTheme : lightTheme,
                  darkTheme: BlocProvider.of<ThemeCubit>(context).isDarkMode == false ? lightTheme : darkTheme,
                  // theme: ThemeData(
                  //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  //   useMaterial3: true,
                  // ),
                  home: const SplashScreen(),
                );
              },
            ),
          );
        });
  }
}
