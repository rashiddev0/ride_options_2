import 'package:ride_options_2/common/const/export.dart';

class TColorSchemeTheme {
  TColorSchemeTheme._();

  static ColorScheme lightColorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.secondary,
      primaryContainer: AppColors.white.withOpacity(0.80),
      onPrimaryContainer: AppColors.white,
      secondary: AppColors.darkGray,
      shadow: AppColors.shadow,
      error: AppColors.red,
      inverseSurface: AppColors.black);
//Customized Dark mode
  static ColorScheme darkColorScheme = ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkSecondary,
      primaryContainer: AppColors.darkWhite,
      onPrimaryContainer: AppColors.darkWhite,
      secondary: AppColors.darkDarkGray,
      shadow: AppColors.darkShadow,
      error: AppColors.red,
      inverseSurface: AppColors.white);
}
