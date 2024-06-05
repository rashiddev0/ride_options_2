

import '../../../../../../common/const/export.dart';
import '../../../../../../common/theme/cubits/theme_cubit.dart';
import '../../../../../../common/theme/cubits/theme_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            addWidth(16.w),
            SvgPicture.asset(
              AppAssets.hamBurger,
              colorFilter: ColorFilter.mode(
                  themeCubit.isDarkMode ?
                  AppColors.darkBlack
                      : AppColors.black,
                  BlendMode.srcIn),
              height: 24.h,
              width: 24.w,
            ),
            addWidth(138.w),
            SvgPicture.asset(
              AppAssets.logoAppBar,
            ),
            addWidth(130.w),
            SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                  themeCubit.isDarkMode ?
                  AppColors.darkBlack
                      : AppColors.black,
                  BlendMode.srcIn),
              AppAssets.icFilter,
              height: 24.h,
              width: 24.w,

            ),
            addWidth(16.w),
          ],
        );
      },
    );
  }
}
