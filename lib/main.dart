import 'package:ride_options_2/common/const/export.dart';

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
          return MaterialApp(
            title: 'Ride Options',

            themeMode: ThemeMode.system,
            theme: lightTheme,
            darkTheme: darkTheme,
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
            onGenerateRoute: AppRoute.generateRoute,
            initialRoute: AppRoute.splashScreen,
          );
        });
  }
}
