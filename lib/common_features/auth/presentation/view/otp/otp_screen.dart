import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/const/export.dart';
import '../../../../../common/custom_widgets/custom_apptext.dart';
import '../../../../../common/custom_widgets/custom_button.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/auth_state.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.phoneVerification,
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
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
                      Text(
                        AppLocalizations.of(context)!.enterYourOtp,
                        style: Theme.of(context).textTheme.bodyMedium!,
                        textAlign: TextAlign.center,
                      ),
                      addHeight(32.h),
                      SvgPicture.asset(
                        AppAssets.otpSvg,
                      ),
                      addHeight(47.5.h),
                      Directionality(
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
                              onCompleted: (v) {},
                              onChanged: (value) {
                                authCubit.otpController.text = value;
                                authCubit.getOtp();
                              }),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 32.h, left: 70.w, right: 70.w),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "${AppLocalizations.of(context)!.didtReceiveCode}\t",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.w500,
                                  )),
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
                              : () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoute.passengerHome, (route) => false);
                          },
                              : () {
                                  Navigator.pushNamed(
                                      context, AppRoute.vehicleRideTypeScreen);
                                },
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
                                  )),
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
                                  text:
                                      "${AppLocalizations.of(context)!.and}\t",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.w500,
                                  )),
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
