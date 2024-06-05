import 'package:ride_options_2/common/const/export.dart';

class TSwitchButtonTheme {
  TSwitchButtonTheme._();

  static SwitchThemeData lightSwitchButtonTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return primaryColor; // Active thumb color
      }
      return const Color(0xff5E5F64); // Inactive thumb color
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return primaryColor.withOpacity(0.10); // Active track color
      }
      return primaryColor.withOpacity(0.10); // Inactive track color
    }),
    trackOutlineColor: MaterialStateProperty.resolveWith((states) {
      return Colors.transparent; // Inactive track color
    }),
  );
//Customized Dark mode
  static SwitchThemeData darkSwitchButtonTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return primaryColor; // Active thumb color
      }
      return const Color(0xffAFAFAF); // Inactive thumb color
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xffDEDAE4); // Active track color
      }
      return const Color(0xff71697C); // Inactive track color
    }),
    trackOutlineColor: MaterialStateProperty.resolveWith((states) {
      return Colors.transparent; // Inactive track color
    }),
  );
}
