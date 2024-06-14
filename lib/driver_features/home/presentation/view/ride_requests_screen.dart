import 'package:ride_options_2/common/const/export.dart';

class RideRequestScreen extends StatelessWidget {
  const RideRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          addHeight(8.h),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(24.r),
            child: Ink(
              padding: EdgeInsets.all(12.h),
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.pointA,
                          width: 24.w,
                          height: 24.h,
                        ),
                        addWidth(8.w),
                        SizedBox(
                          width: 270.w,
                          child: Text(
                            "Maulana Shaukat Ali Rd Main (Sector A 1)Maulana Shaukat AliMaulana Shaukat Ali Rd Main (Sector A 1)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        Icon(
                          Icons.cancel,
                          size: 25.sp,
                          color: Theme.of(context).colorScheme.error,
                        )
                      ]),
                  addHeight(8.h),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.pointB,
                          width: 24.w,
                          height: 24.h,
                        ),
                        addWidth(8.w),
                        SizedBox(
                          width: 270.w,
                          child: Text(
                            "Maulana Shaukat Ali Rd Main (Sector A 1)Maulana Shaukat AliMaulana Shaukat Ali Rd Main (Sector A 1)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ]),
                  addHeight(16.h),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rs.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          "330",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        addWidth(8.w),
                        Text(
                          "3km",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        addWidth(8.w),
                        Text(
                          "5min",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoute.driverInRideScreen, (route) => false);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 150.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Accepts",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: AppColors.white,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w700),
                                ),
                                addWidth(12.w),
                                Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                  size: 26.sp,
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
