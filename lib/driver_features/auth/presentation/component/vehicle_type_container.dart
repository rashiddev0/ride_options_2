import 'package:ride_options_2/common/const/export.dart';

// ignore: must_be_immutable
class VehicleTypeContainer extends StatelessWidget {
  VehicleTypeContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.desc,
    required this.icon,
    required this.width,
    required this.height,
  });
  VoidCallback onTap;
  final String title;
  final String desc;
  final String icon;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 134.h,
        width: 361.w,
        padding: EdgeInsets.only(top: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 20.r,
              offset: Offset(0, 20.h),
              spreadRadius: -25.r,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: width,
                  height: height,
                ),
                addWidth(12.w),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                addWidth(8.w),
                SvgPicture.asset(AppAssets.info),
              ],
            ),
            addHeight(8.h),
            SizedBox(
              width: 286.w,
              child: Text(
                textAlign: TextAlign.center,
                desc,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
