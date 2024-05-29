import 'package:ride_options_2/common/const/export.dart';

class DrawerTile extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;

  const DrawerTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        height: 60.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 28.w,
              height: 28.h,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
            ),
            addWidth(16.w),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
