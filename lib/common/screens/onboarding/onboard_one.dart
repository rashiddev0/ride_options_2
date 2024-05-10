import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_options_2/common/const/colors.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/const/strings.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';
import 'package:ride_options_2/common/screens/onboarding/cubits/onboard_cubit.dart';
import 'package:ride_options_2/common/screens/onboarding/cubits/onboard_state.dart';

import '../../../routes/app_route.dart';

class OnBoardOne extends StatelessWidget {
  const OnBoardOne({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardCubit = BlocProvider.of<OnboardCubit>(context);
    return Scaffold(
      body: BlocConsumer<OnboardCubit, OnboardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 40.h, left: 12.w, right: 12, bottom: 54.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 302.w),
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
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      onTap: ()=>Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.accountType, (route) => false),
                    ),
                  ),
                  SvgPicture.asset(
                    onboardCubit.boardingIndex == 0 ? AppAssets.onboardingOne : onboardCubit.boardingIndex == 1 ? AppAssets.onboardingTwo : AppAssets.onboardingThree,
                    height: 208.h,
                  ),
                  addHeight(34.h),
                  Text(onboardCubit.boardingIndex == 0 ? AppStrings.anywhereYouAre : onboardCubit.boardingIndex == 1 ? AppStrings.atAnytime : AppStrings.bookYourCar,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center),
                  addHeight(12.h),
                  Text(
                    AppStrings.sellHouseEasilly,
                    style: Theme.of(context).textTheme.headlineSmall,
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
                              width: 1.w, color: Theme.of(context).primaryColor)),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    onTap: (){
                      onboardCubit.getBoardingIndex();
                      if(onboardCubit.boardingIndex == 3){
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoute.accountType, (route) => false);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
