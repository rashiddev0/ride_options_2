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
    iconTheme: IconThemeData(
      color: AppColors.textWhite,
    ),
    backgroundColor: AppColors.black,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textWhite,
    ),
  );
}
