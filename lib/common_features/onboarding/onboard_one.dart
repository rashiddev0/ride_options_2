
import 'package:ride_options_2/common/const/colors.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_apptext.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/common_features/onboarding/cubits/onboard_cubit.dart';
import 'package:ride_options_2/common_features/onboarding/cubits/onboard_state.dart';

class OnBoardOne extends StatelessWidget {
  const OnBoardOne({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final onboardCubit = BlocProvider.of<OnboardCubit>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: 75.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                            width: 1.w,
                            color: Theme.of(context).primaryColor)),
                    child: AppText(
                      AppLocalizations.of(context)!.skip,
                      style: const TextStyle(),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.accountType, (route) => false);
                  }),
            ),
          ),
        ],
      ),
      body: BlocConsumer<OnboardCubit, OnboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12, bottom: 54.h),
            child: Column(
              children: [
                addHeight(143.h),
                SvgPicture.asset(
                  onboardCubit.boardingIndex == 0
                      ? AppAssets.onboardingOne
                      : onboardCubit.boardingIndex == 1
                          ? AppAssets.onboardingTwo
                          : AppAssets.onboardingThree,
                  height: 208.h,
                ),
                addHeight(24.h),
                AppText(
                  onboardCubit.boardingIndex == 0
                      ? AppLocalizations.of(context)!.anywhereYouAre
                      : onboardCubit.boardingIndex == 1
                          ? AppLocalizations.of(context)!.atAnytime
                          : AppLocalizations.of(context)!.bookYourCar,
                  style: Theme.of(context).textTheme.displayLarge!,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                addHeight(12.h),
                AppText(
                  AppLocalizations.of(context)!.sellHouseEasilly,
                  style: Theme.of(context).textTheme.displaySmall!,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: 86.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                            width: 1.w,
                            color: Theme.of(context).primaryColor)),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  onTap: () {
                    onboardCubit.getBoardingIndex();
                    if (onboardCubit.boardingIndex == 3) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.accountType, (route) => false);
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
