import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/const/colors.dart';
import '../../../../../common/const/export.dart';
import '../../../../../common/custom_widgets/custom_apptext.dart';
import '../../../../../common/custom_widgets/custom_button.dart';
import '../../../../../common/custom_widgets/custom_textfield.dart';
import '../../../../../common/theme/cubits/theme_cubit.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/auth_state.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          AppLocalizations.of(context)!.phoneNumber,
          style: Theme.of(context).textTheme.displayLarge!,
          textAlign: TextAlign.center,
          fontSize: 26.sp,
          fontWeight: FontWeight.w700,
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
                  top: 27.h, left: 12.w, right: 12, bottom: 54.h),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 660.h,
                  child: Column(
                    children: [
                      AppText(
                        AppLocalizations.of(context)!.enterYourPhone,
                        style: Theme.of(context).textTheme.displayLarge!,
                        textAlign: TextAlign.center,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      addHeight(32.h),
                      SvgPicture.asset(
                        AppAssets.phoneSecSvg,
                        width: 172.w,
                        height: 172.h,
                      ),
                      addHeight(55.h),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CustomTextField(
                          controller: authCubit.phoneNumberController,
                          hintText: "3311234567",
                          keyboardType: TextInputType.number,
                          visible: true,
                          onChange: (value) {
                            authCubit.phoneNumberController.text = value;
                            authCubit.getNumber();
                          },
                        ),
                      ),
                      /*Visibility(
                        visible: authCubit.phoneNoErrorVisible,
                        child: Text(
                          authCubit.,
                          style: errorMessageLightIn12px(),
                        ),
                      ),*/
                      const Spacer(),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.next,
                          onTap: authCubit.phoneNumberController.text.isEmpty
                              ? null
                              : () {
                                  Navigator.pushNamed(
                                      context, AppRoute.otpScreen);
                                },
                          borderColor: Theme.of(context).primaryColor,
                          icon: Icons.arrow_back_ios,
                          titleSize: 18.sp,
                          textColor:  Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 37.5.h, left: 55.w, right: 55.w),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${AppLocalizations.of(context)!.bySigningUp}\t",
                                style:
                                TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.lightGray,
                                  fontWeight: FontWeight.w500,
                                )
                              ),
                              TextSpan(
                                text:
                                    "${AppLocalizations.of(context)!.termsOfService}\t",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "${AppLocalizations.of(context)!.and}\t",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.lightGray,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text:
                                    AppLocalizations.of(context)!.privacyPolicy,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
