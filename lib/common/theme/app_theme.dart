import 'package:ride_options_2/common/const/export.dart';

const colorPrimary = Colors.deepOrangeAccent;
const colorAccent = Colors.orange;


ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Nunito",
  brightness: Brightness.light,
  primaryColor: const Color(0xff6D41A2),
  scaffoldBackgroundColor: const Color(0xffF3F3F3),
  disabledColor: const Color(0xff9E9FA4),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: const Color(0xff2A2A2A),
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: const Color(0xffA0A0A0),
        fontWeight: FontWeight.w500),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: colorAccent),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r))),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff6D41A2)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  ),
);
//**************************** This section for dark theme *********************** */
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Nunito",
  brightness: Brightness.dark,
  textTheme: TextTheme(
    headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: const Color(0xffA0A0A0),
        fontWeight: FontWeight.w500),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 197, 163, 240)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);

ThemeData systemTheme = lightTheme;
