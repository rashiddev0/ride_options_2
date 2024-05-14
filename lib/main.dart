import 'package:ride_options_2/common/auth/cubit/auth_cubit.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';
import 'package:ride_options_2/common/onboarding/cubits/onboard_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_state.dart';

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
            ],
            child: BlocConsumer<ThemeCubit, ThemeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(state is InitState){
                  if(MediaQuery.of(context).platformBrightness == Brightness.dark){
                    BlocProvider.of<ThemeCubit>(context).toggleTheme(true);
                  }else if(MediaQuery.of(context).platformBrightness == Brightness.light){
                    BlocProvider.of<ThemeCubit>(context).toggleTheme(false);
                  }
                }
                return BlocBuilder<LocalizationCubit, Locale>(
                  builder: (context, locale) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: locale.countryCode == "+92" ? false : false,
                      title: 'Ride Options',
                     // themeMode: ThemeMode.system,
                      theme: BlocProvider.of<ThemeCubit>(context).isDarkMode ==
                              true
                          ? darkTheme
                          : lightTheme,
                      darkTheme:
                          BlocProvider.of<ThemeCubit>(context).isDarkMode ==
                                  false
                              ? lightTheme
                              : darkTheme,
                      // theme: ThemeData(
                      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      //   useMaterial3: true,
                      // ),
                      onGenerateRoute: AppRoute.generateRoute,
                      initialRoute: AppRoute.splashScreen,

                      //****************** This section for Localization***********************/
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: locale,
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
