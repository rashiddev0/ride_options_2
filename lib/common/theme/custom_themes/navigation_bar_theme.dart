import 'package:ride_options_2/common/const/export.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
    backgroundColor: AppColors.backGround,
    elevation: 0,
    indicatorColor: AppColors.primary.withOpacity(0.10),
    labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
      if (states.contains(MaterialState.selected)) {
        return TextStyle(
          color: primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        );
      }
      return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGray,
      );
    }),
    // iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((states) {
    //   if (states.contains(MaterialState.selected)) {
    //     return IconThemeData(color: AppColors.primary, size: 25.sp);
    //   }
    //   return IconThemeData(
    //     color: AppColors.black,
    //   );
    // }),
  );
//Customized Dark mode
  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: AppColors.darkBackGround,
    elevation: 0,
    indicatorColor: AppColors.primary.withOpacity(0.10),
    labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
      if (states.contains(MaterialState.selected)) {
        return TextStyle(
          color: primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        );
      }
      return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.darkDarkGray,
      );
    }),
    // iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((states) {
    //   if (states.contains(MaterialState.selected)) {
    //     return IconThemeData(color: AppColors.primary, size: 25.sp);
    //   }
    //   return IconThemeData(
    //     color: AppColors.black,
    //   );
    // }),
  );
}
