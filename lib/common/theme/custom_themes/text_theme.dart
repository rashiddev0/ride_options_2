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
        fontSize: 26.sp,
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
        fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 18.sp,
        color: AppColors.darkGray,
        fontWeight: FontWeight.w400),
    labelLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500),
    labelMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 16.sp,
        color: AppColors.darkGray,
        fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400),
  );
//Customized Dark mode
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 26.sp,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 26.sp,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w500),
    titleLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 20.sp,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w500),
    titleMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 20.sp,
        color: AppColors.darkDarkGray,
        fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 18.sp,
        color: AppColors.darkBlack,
        fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 18.sp,
        color: AppColors.darkDarkGray,
        fontWeight: FontWeight.w400),
    labelLarge: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500),
    labelMedium: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 16.sp,
        color: AppColors.darkDarkGray,
        fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        wordSpacing: -0.5.sp,
        fontSize: 16.sp,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w400),
  );
}
