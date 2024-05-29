import 'package:ride_options_2/common/custom_widgets/custom_apptext.dart';
import 'package:ride_options_2/common_features/auth/presentation/component/role_contaner.dart';
import 'package:ride_options_2/common_features/auth/presentation/cubits/auth_cubit.dart';

import '../../../../../common/const/export.dart';
import '../../cubits/auth_state.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          AppLocalizations.of(context)!.chooseOne,
          style: Theme.of(context).textTheme.displayLarge!,
          fontSize: 26.sp,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 51.h, left: 12.w, right: 12.w, bottom: 54.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.proQuestion,
                    width: 124.w,
                    height: 124.h,
                  ),
                  SizedBox(
                    width: 262.w,
                    child: AppText(
                      AppLocalizations.of(context)!.howDoYouWant,
                      style: Theme.of(context).textTheme.displaySmall!,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  addHeight(67.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoleContaner(
                            role: AppLocalizations.of(context)!.passenger,
                            roleIcon: AppAssets.passengerIcon),
                        addWidth(16.w),
                        RoleContaner(
                            role: AppLocalizations.of(context)!.driver,
                            roleIcon: AppAssets.driverIcon),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton(
                      child: Text(
                        AppLocalizations.of(context)!.next,
                      ),
                      onPressed: authCubit.selectedRole == null
                          ? null
                          : () {
                              if (authCubit.selectedRole ==
                                  AppLocalizations.of(context)!.passenger) {
                                Navigator.pushNamed(
                                  context,
                                  AppRoute.numberScreen,
                                );
                              } else if (authCubit.selectedRole ==
                                  AppLocalizations.of(context)!.driver) {
                                Navigator.pushNamed(
                                  context,
                                  AppRoute.vehicleTypeScreen,
                                );
                              }
                            },
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
