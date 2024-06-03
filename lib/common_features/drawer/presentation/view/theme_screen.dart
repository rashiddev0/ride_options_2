import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_toggle_button.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_state.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: CustomAppBar(
              title: Text(AppLocalizations.of(context)!.theme),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  addHeight(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.useSystemTheme),
                      Switch(
                        value: themeCubit.useSystemTheme,
                        onChanged: (value) {
                          themeCubit.setSystemTheme(value);
                        },
                      )
                    ],
                  ),
                  addHeight(16.h),
                  if (!themeCubit.useSystemTheme)
                    CustomToggle(
                      values: [
                        AppLocalizations.of(context)!.light,
                        AppLocalizations.of(context)!.dark
                      ],
                      icons: const [
                        Icons.light_mode_outlined,
                        Icons.dark_mode_outlined
                      ],
                      initialPosition: themeCubit.isDarkMode ? false : true,
                      onToggleCallback: (value) {
                        themeCubit.toggleTheme(value == 1);
                      },
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
