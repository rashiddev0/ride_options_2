import 'package:ride_options_2/common/custom_widgets/custom_apptext.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';
import 'package:ride_options_2/common/localization/classes/language.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';
import 'package:ride_options_2/common_features/auth/presentation/cubits/auth_cubit.dart';

import '../../../../../common/const/colors.dart';
import '../../../../../common/const/export.dart';
import '../../cubits/auth_state.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final localCubit = BlocProvider.of<LocalizationCubit>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: blackColor,
              ),
              onChanged: (Language? language) async {
                if (language != null && language.languageCode == "ur") {
                  localCubit.setUrduLocale();
                } else {
                  localCubit.setEnglishLocale();
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
        title: Text(
          AppLocalizations.of(context)!.chooseOne,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 24.h, left: 12.w, right: 12.w, bottom: 54.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.proQuestion,
                    width: 124.w,
                    height: 124.h,
                  ),
                  AppText(
                    AppLocalizations.of(context)!.pakistan,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    width: 262.w,
                    child: Text(AppLocalizations.of(context)!.howDoYouWant,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: greyColor),
                        textAlign: TextAlign.center),
                  ),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodySmall
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
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodySmall
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
                      onTap: authCubit.selectedRole == null
                          ? null
                          : () {
                              if (authCubit.selectedRole == "Passenger") {
                                // Navigator.pushNamed(
                                //   context,
                                //   AppRoute.numberScreen,
                                // );
                              } else if (authCubit.selectedRole == "Driver") {
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
