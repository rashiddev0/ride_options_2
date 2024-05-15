import 'package:ride_options_2/common/const/colors.dart';
import 'package:ride_options_2/common/const/export.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  // fontFamily: "Nunito",
  brightness: Brightness.light,
  primaryColor: const Color(0xff6D41A2),
  scaffoldBackgroundColor:
      const Color(0xffF9F9F9), // Adjusted background color for light theme
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

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size(337.w, 54.h),
      backgroundColor: const Color(0xff6D41A2),
      disabledBackgroundColor: const Color(0x256d41a2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  ),
  //****************** This section for AppBar********************* */
  appBarTheme:
      const AppBarTheme(backgroundColor: whiteColor, centerTitle: true),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Nunito",
  brightness: Brightness.dark,
  primaryColor: const Color(0xff875BBD),
  scaffoldBackgroundColor:
      const Color(0xff2D2D2D), // Adjusted background color for dark theme
  textTheme: TextTheme(
    headlineMedium: TextStyle(
        fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: const Color(0xffA0A0A0),
        fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size(337.w, 54.h),
      backgroundColor: const Color(0xff6D41A2),
      disabledBackgroundColor: const Color(0x256d41a2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  ),
);

ThemeData systemTheme = lightTheme;






 //****************** this section for Floating Action button********************* */
  // floatingActionButtonTheme:
  //     const FloatingActionButtonThemeData(backgroundColor: primaryColor),

  // //****************** this section for Elevated button********************* */
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //           const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
  //       shape: MaterialStateProperty.all<OutlinedBorder>(
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r))),
  //       backgroundColor:
  //           MaterialStateProperty.all<Color>(const Color(0xff6D41A2)),
  //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
  // ),
  // //****************** this section for Text Field button********************* */
  // inputDecorationTheme: InputDecorationTheme(
  //   border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
  //   filled: true,
  //   fillColor: Colors.grey.withOpacity(0.1),
  // ),

  // //****************** this section for Switch button button********************* */
  // switchTheme: SwitchThemeData(
  //   trackColor: MaterialStateProperty.all<Color>(Colors.grey),
  //   thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  // ),
  // //****************** this section for TextField********************* */
  // inputDecorationTheme: InputDecorationTheme(
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(20.0),
  //         borderSide: BorderSide.none),
  //     filled: true,
  //     fillColor: Colors.grey.withOpacity(0.1)),
  // //****************** this section for Elevated  button********************* */
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //       EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
  //     ),
  //     shape: MaterialStateProperty.all<OutlinedBorder>(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //     ),
  //     backgroundColor: MaterialStateProperty.all<Color>(
  //         const Color.fromARGB(255, 197, 163, 240)),
  //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  //     overlayColor: MaterialStateProperty.all<Color>(Colors.black26),
  //   ),
  // ),