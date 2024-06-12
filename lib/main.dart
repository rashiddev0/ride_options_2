import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_state.dart';
import 'package:ride_options_2/passenger_features/bloc_test/test_map/test_map_bloc.dart';
import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ride_options_2/passenger_features/ride_feature/presentation/bloc/in_ride_map_bloc/in_ride_map_bloc.dart';
import 'package:ride_options_2/common_features/auth/presentation/cubits/auth_cubit.dart';
import 'package:ride_options_2/common_features/internet_check/cubit/internet_cubit.dart';
import 'package:ride_options_2/common_features/onboarding/cubits/onboard_cubit.dart';
import 'package:ride_options_2/driver_features/auth/presentation/cubit/auth_cubit.dart';

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
            BlocProvider(create: (_) => LocalizationCubit()),
            BlocProvider(create: (_) => OnboardCubit()),
            BlocProvider(create: (_) => AuthCubit()),
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => InRideMapBloc()),
            BlocProvider(create: (_) => InternetCubit()),
            BlocProvider(create: (_) => DriverAuthCubit()),
            BlocProvider(create: (_) => TestMapBloc()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              final themeCubit = BlocProvider.of<ThemeCubit>(context);
              ThemeMode themeMode;

              if (themeCubit.useSystemTheme) {
                themeMode = ThemeMode.system;
              } else if (themeCubit.isDarkMode) {
                themeMode = ThemeMode.dark;
              } else {
                themeMode = ThemeMode.light;
              }
              return BlocBuilder<LocalizationCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: locale,
                    debugShowCheckedModeBanner: false,
                    title: 'Ride Options',
                    onGenerateRoute: AppRoute.generateRoute,
                    initialRoute: AppRoute.splashScreen,
                    theme: AppTheme.lightTheme(
                      context,
                      locale.toString() == "ur" ? "jameelUrdu" : "Nunito",
                    ),
                    darkTheme: AppTheme.darkTheme(
                      context,
                      locale.toString() == "ur" ? "jameelUrdu" : "Nunito",
                    ),
                    themeMode: themeMode,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
