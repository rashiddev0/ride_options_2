import 'package:ride_options_2/common/const/export.dart';

// ignore: must_be_immutable
class VehicleTypeContainer extends StatelessWidget {
  VehicleTypeContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.desc,
    required this.icon,
  });
  VoidCallback onTap;
  final String title;
  final String desc;
  final String icon;
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
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
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
                  width: 88.w,
                  height: 52.31.h,
                ),
                addWidth(12.w),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w400),
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
