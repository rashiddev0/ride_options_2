import 'package:ride_options_2/common/const/export.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
          color: const Color(0xffF7F7F7),
          fontSize: 20.sp,
          fontWeight: FontWeight.w700),
      foregroundColor: const Color(0xffF7F7F7),
      disabledForegroundColor: const Color(0xff9E9FA4),
      elevation: 0,
      minimumSize: Size(337.w, 54.h),
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: const Color(0xff6D41A2).withOpacity(0.10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  );
//Customized Dark mode
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
          color: const Color(0xff0F1110),
          fontSize: 20.sp,
          fontWeight: FontWeight.w700),
      foregroundColor: const Color(0xff0F1110),
      disabledForegroundColor: const Color(0xff7B7B7B),
      elevation: 0,
      minimumSize: Size(337.w, 54.h),
      backgroundColor: AppColors.darkPrimary,
      disabledBackgroundColor: const Color(0xff0C0712).withOpacity(0.20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  );
}
