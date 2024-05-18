import 'package:ride_options_2/common/const/colors.dart';
import 'package:ride_options_2/common/const/export.dart';

class VehicleType extends StatelessWidget {
  const VehicleType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select On",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 27.h),
          child: Column(
            children: [
              Container(
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
                          AppAssets.bike,
                          width: 88.w,
                          height: 52.31.h,
                        ),
                        addWidth(12.w),
                        Text(
                          'Bike',
                          style: TextStyle(
                              fontSize: 26.sp, fontWeight: FontWeight.w400),
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
                          'Economy fast and easiest way to move around the city.'),
                    )
                  ],
                ),
              ),
              addHeight(10.h),
              Container(
                color: ThemeData().colorScheme.onPrimary,
                width: 200.w,
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
