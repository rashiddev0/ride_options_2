import 'package:ride_options_2/common/const/colors.dart';
import 'package:ride_options_2/common/const/export.dart';

class VehicleType extends StatelessWidget {
  const VehicleType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Select On",
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
              addHeight(50.h),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Next"),
                      addWidth(12.w),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
