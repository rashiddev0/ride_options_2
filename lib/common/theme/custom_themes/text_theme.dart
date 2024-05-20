import 'package:ride_options_2/common/const/export.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 26.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 24.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 22.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500),
    titleLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 20.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500),
    titleMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 20.sp,
        color: AppColors.darkGray,
        fontWeight: FontWeight.w500),
    titleSmall: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 18.sp,
        color: const Color(0xff525357),
        fontWeight: FontWeight.w300),
  );
//Customized Dark mode
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      wordSpacing: -0.5.sp,
      color: const Color(0xffF7F7F7),
    ),
    displaySmall: TextStyle(
      wordSpacing: -0.5.sp,
      color: const Color(0xffAFAFAF),
    ),
  );
}
