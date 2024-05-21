import 'package:ride_options_2/common/const/export.dart';

class TColorSchemeTheme {
  TColorSchemeTheme._();

  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.secondary,
    primaryContainer: AppColors.white,
    shadow: AppColors.shadow,
    error: AppColors.red,
  );
//Customized Dark mode
  static ColorScheme darkColorScheme = ColorScheme.light();
}
