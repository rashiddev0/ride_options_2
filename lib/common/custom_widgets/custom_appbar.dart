import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/internet_check/cubit/internet_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppBar(
          backgroundColor: state == InternetState.Gained ? null : Colors.red,
          toolbarHeight: 60.h,
          // leadingWidth: double.maxFinite,
          title: state == InternetState.Gained
              ? Text(title)
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.signal_wifi_off, color: AppColors.white),
                        addWidth(8.w),
                        Text(
                          "Internet Disconnected!",
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 295.w,
                      child: Text(
                        "You need to connect to the internet for this app to function properly!",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
