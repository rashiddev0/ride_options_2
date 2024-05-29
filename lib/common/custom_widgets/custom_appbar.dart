import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common_features/internet_check/cubit/internet_cubit.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? bgColor;
  double height;
  IconThemeData? iconThemeData;
  final Widget? leading;
  List<Widget>? action;
  CustomAppBar({
    super.key,
    this.title,
    this.bgColor,
    this.height = 60,
    this.iconThemeData,
    this.action,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppBar(
          titleTextStyle: Theme.of(context).textTheme.headlineLarge,
          backgroundColor: state == InternetState.Gained ? bgColor : Colors.red,
          toolbarHeight: height,
          actions: action,
          leading: leading,
          iconTheme: iconThemeData,
          title: state == InternetState.Gained
              ? title
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
  Size get preferredSize => Size.fromHeight(height);
}
