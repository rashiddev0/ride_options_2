import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_options_2/common/auth/cubit/auth_cubit.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';

import '../../const/colors.dart';
import '../../const/export.dart';
import '../cubit/auth_state.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.chooseOne,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 24.h, left: 12.w, right: 12, bottom: 54.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.proQuestion,
                  ),
                  Text(AppLocalizations.of(context)!.howDoYouWant,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center),
                  addHeight(67.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(16.r),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                //borderRadius: BorderRadius.circular(100.r),
                              ),
                              width: 130.w,
                              height: 169.h,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 24.h, left: 25.w, right: 25.w),
                                    child: SvgPicture.asset(
                                      AppAssets.passengerIcon,
                                      colorFilter: ColorFilter.mode(
                                          authCubit.selectedRole == null ||
                                                  authCubit.selectedRole !=
                                                      "Passenger"
                                              ? greyColor
                                              : Theme.of(context).primaryColor,
                                          BlendMode.srcIn),
                                      fit: BoxFit.cover,
                                      width: 80.w,
                                      height: 80.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Text(
                                      AppLocalizations.of(context)!.passenger,
                                      style: authCubit.selectedRole == null ||
                                              authCubit.selectedRole !=
                                                  "Passenger"
                                          ? Theme.of(context).textTheme.bodySmall
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () => authCubit.getRole("Passenger"),
                        ),
                        addWidth(16.w),
                        InkWell(
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              width: 130.w,
                              height: 169.h,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 24.h, left: 25.w, right: 25.w),
                                    child: SvgPicture.asset(
                                      AppAssets.driverIcon,
                                      colorFilter: ColorFilter.mode(
                                          authCubit.selectedRole == null ||
                                                  authCubit.selectedRole !=
                                                      "Driver"
                                              ? greyColor
                                              : Theme.of(context).primaryColor,
                                          BlendMode.srcIn),
                                      fit: BoxFit.cover,
                                      width: 80.w,
                                      height: 80.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Text(
                                      AppLocalizations.of(context)!.driver,
                                      style: authCubit.selectedRole == null ||
                                              authCubit.selectedRole != "Driver"
                                          ? Theme.of(context).textTheme.bodySmall
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () => BlocProvider.of<AuthCubit>(context)
                              .getRole("Driver"),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CustomButton(
                      title: AppLocalizations.of(context)!.next,
                      onTap: authCubit.selectedRole == null ? null : (){
                        if(authCubit.selectedRole == "Passenger"){
                          Navigator.pushNamed(
                              context, AppRoute.numberScreen,);
                        }else if(authCubit.selectedRole == "Driver"){
                          debugPrint("😊😊😊152😊😊😊Under Development");
                        }
                      },
                      borderColor: Theme.of(context).primaryColor,
                      icon: Icons.arrow_back_ios,
                      titleSize: 18.sp,
                      textColor: Colors.white,
                    ),
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
