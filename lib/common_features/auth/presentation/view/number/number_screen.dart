import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_options_2/common/custom_widgets/custom_textfield.dart';

import '../../../../../common/const/export.dart';
import '../../../../../common/custom_widgets/custom_button.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/auth_state.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.phoneNumber,
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
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 660.h,
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.enterYourPhone,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      addHeight(32.h),
                      SvgPicture.asset(
                        AppAssets.phoneSecSvg,
                      ),
                      addHeight(47.5.h),
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
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
