import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_state.dart';
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
            ],
            child: BlocConsumer<ThemeCubit, ThemeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is InitState) {
                  debugPrint("///35///");
                  if (MediaQuery.of(context).platformBrightness ==
                      Brightness.dark) {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme(true);
                  } else if (MediaQuery.of(context).platformBrightness ==
                      Brightness.light) {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme(false);
                  }
                }
                return BlocBuilder<LocalizationCubit, Locale>(

                  builder: (context, locale) {

                    return MaterialApp(
                      localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: locale,
                      debugShowCheckedModeBanner:
                      locale.countryCode == "+92" ? false : false,
                      title: 'Ride Options',
                      // themeMode: ThemeMode.system,

                      onGenerateRoute: AppRoute.generateRoute,
                      initialRoute: AppRoute.splashScreen,
                      theme: BlocProvider.of<ThemeCubit>(context).isDarkMode ==
                          true
                          ? AppTheme.darkTheme(context,locale.toString()=="ur"?"jameelUrdu":"Nunito" )
                          : AppTheme.lightTheme(context,locale.toString()=="ur"?"jameelUrdu":"Nunito" ),
                      darkTheme:
                      BlocProvider.of<ThemeCubit>(context).isDarkMode ==
                          false
                          ? AppTheme.lightTheme(context,locale.toString()=="ur"?"jameelUrdu":"Nunito" )
                          : AppTheme.darkTheme(context,locale.toString()=="ur"?"jameelUrdu":"Nunito" ),

                      //****************** This section for Localization***********************/

                    );
                  },
                );
              },
            ),
          );
        });
  }
}
