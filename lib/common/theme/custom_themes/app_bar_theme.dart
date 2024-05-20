import 'package:ride_options_2/common/const/export.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.black),
    backgroundColor: AppColors.white,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 26.sp, fontWeight: FontWeight.w700, color: AppColors.black),
  );
//Customized Dark mode
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Color(0xffF7F7F7),
    ),
    backgroundColor: AppColors.black,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xffF7F7F7)),
  );
}
