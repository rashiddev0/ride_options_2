import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/const/colors.dart';
import '../../../../../common/const/export.dart';
import '../../../../../common/custom_widgets/custom_apptext.dart';
import '../../../../../common/custom_widgets/custom_button.dart';
import '../../../../../common/theme/cubits/theme_cubit.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/auth_state.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
          AppLocalizations.of(context)!.phoneVerification,
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
                        AppLocalizations.of(context)!.enterYourOtp,
                        style: Theme.of(context).textTheme.displaySmall!,
                        textAlign: TextAlign.center,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightGray,
                      ),
                      addHeight(32.h),
                      SvgPicture.asset(
                        AppAssets.otpSvg,
                      ),
                      addHeight(47.5.h),
                      /*Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: EdgeInsets.only(left: 50.w, right: 50.w),
                          child: PinCodeTextField(
                            autoFocus: true,
                            enablePinAutofill: false,
                            useExternalAutoFillGroup: false,

                            onAutoFillDisposeAction:
                                AutofillContextAction.cancel,
                            autovalidateMode: AutovalidateMode.disabled,
                            appContext: context,
                            length: 4,
                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              activeFillColor:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? const Color(0xff242424)
                                      : secondaryColor,
                              inactiveFillColor: whiteColor,
                              errorBorderColor: redColor,
                              inactiveColor: greyColor,
                              activeColor: secondaryColor,
                              selectedColor: primaryColor,
                              selectedFillColor: whiteColor,
                              borderWidth: .5.w,
                              inactiveBorderWidth: .5.w,
                              selectedBorderWidth: 1.w,
                              activeBorderWidth: .5.w,
                              borderRadius: BorderRadius.circular(12.r),
                              fieldHeight: 60.h,
                              fieldWidth: 60.w,

                              //activeFillColor: hasError ? Colors.red : Colors.white,
                            ),
                            cursorColor: AppColors.primary,
                            animationDuration:
                                const Duration(milliseconds: 400),
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            backgroundColor: Colors.transparent,
                            enableActiveFill: true,
                            //errorAnimationController: errorController,
                            controller: authCubit.otpController,
                            keyboardType: TextInputType.number,
                            beforeTextPaste: (_) => false,

                            onCompleted: (v) {
                              //izhar_comment
                              //loadingAlertDialog(context: context);

                              *//* AuthenticateService().verifyOTP(
                                context,
                                CommonFunctions.phoneCodeList[0] +
                                    authProvider.phoneNumberController.text,
                                otpController.text,
                                authProvider.roleController.text,
                              );*//*
                            },

                            onChanged: (value) {
                              authCubit.otpController.text = value;
                              authCubit.getOtp();
                              *//*print(value);
                              setState(() {
                                currentText = value;
                              });*//*
                            },
                          ),
                        ),
                      ),*/
                      Padding(
                        padding:
                            EdgeInsets.only(top: 32.h, left: 70.w, right: 70.w),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${AppLocalizations.of(context)!.didtReceiveCode}\t",
                                  style:
                                  TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.w500,
                                  )
                              ),
                              TextSpan(
                                text:
                                    "${AppLocalizations.of(context)!.resendAgain}\t",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.next,
                          onTap: authCubit.otpController.text.isEmpty
                              ? null
                              : () {},
                          borderColor: Theme.of(context).primaryColor,
                          icon: Icons.arrow_back_ios,
                          titleSize: 18.sp,
                          textColor: Colors.white,
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
                                style: TextStyle(
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
                                  )
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
