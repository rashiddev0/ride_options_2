import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/theme/custom_themes/app_bar_theme.dart';
import 'package:ride_options_2/common/theme/custom_themes/color_scheme_theme.dart';
import 'package:ride_options_2/common/theme/custom_themes/elevated_button_theme.dart';
import 'package:ride_options_2/common/theme/custom_themes/text_theme.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context, String appFontFamily) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: appFontFamily,

      scaffoldBackgroundColor: AppColors.backGround,

      colorScheme: TColorSchemeTheme.lightColorScheme,

      disabledColor: AppColors.disable,

      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      //****************** This section for AppBar********************* */
      appBarTheme: TAppBarTheme.lightAppBarTheme,
    );
  }

  static ThemeData darkTheme(BuildContext context, String appFontFamily) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: appFontFamily,
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      scaffoldBackgroundColor:
          AppColors.darkBackGround, // Adjusted background color for dark theme

      textTheme: TTextTheme.darkTextTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      colorScheme: TColorSchemeTheme.darkColorScheme,
    );
  }
}

//ThemeData systemTheme = lightTheme;






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