import 'package:ride_options_2/common/const/export.dart';

// ignore: must_be_immutable
class DriverDetailTile extends StatelessWidget {
  DriverDetailTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon2,
    required this.icon,
  });
  VoidCallback onTap;
  final String title;
  final String icon2;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70.h,
          width: 361.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                blurRadius: 20.r,
                offset: Offset(0, 20.h),
                spreadRadius: -25.r,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.center,
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  icon2 != ""
                      ? SvgPicture.asset(
                          icon2,
                        )
                      : const SizedBox(),
                  addWidth(8.w),
                  SvgPicture.asset(icon),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
