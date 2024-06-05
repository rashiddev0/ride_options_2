

import '../../../../common/const/export.dart';
import '../../../../common/theme/cubits/theme_cubit.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class RoleContaner extends StatelessWidget {
  String role;
  String roleIcon;

  RoleContaner({super.key,
    required this.role,
    required this.roleIcon});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          child: Container(
            decoration: BoxDecoration(
              /*color: authCubit.selectedRole == null || authCubit.selectedRole != role
                  ? themeCubit.isDarkMode == true
                  ? AppColors.darkDisable
                  : AppColors.disable
                  : themeCubit.isDarkMode == true
                  ? AppColors.darkWhite
                  : AppColors.white,*/
              color: authCubit.selectedRole == null || authCubit.selectedRole != role
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  spreadRadius: authCubit.selectedRole == null || authCubit.selectedRole != role ? 0.r : -12.r,
                  blurRadius: authCubit.selectedRole == null || authCubit.selectedRole != role ? 0.r : 10.r,
                  offset: authCubit.selectedRole == null || authCubit.selectedRole != role ? Offset(0, 0.r) : Offset(0, 10.r), // changes position of shadow
                ),
              ],
              //borderRadius: BorderRadius.circular(100.r),
            ),
            width: 130.w,
            height: 169.h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.h, left: 25.w, right: 25.w),
                  child: SvgPicture.asset(
                    roleIcon,
                    colorFilter: ColorFilter.mode(
                        authCubit.selectedRole == null || authCubit.selectedRole != role
                            ? AppColors.lightGray
                            : Theme
                            .of(context)
                            .primaryColor,
                        BlendMode.srcIn),
                    fit: BoxFit.cover,
                    width: 80.w,
                    height: 80.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Text(
                    role,
                    style: authCubit.selectedRole == null || authCubit.selectedRole != role ? Theme.of(context).textTheme.bodyMedium! : Theme.of(context).textTheme.titleLarge!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            authCubit.getRole(role);
          },
        );
      },
    );
  }
}
