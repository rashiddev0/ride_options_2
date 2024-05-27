import '../../../../../../common/const/export.dart';

class RideBox extends StatelessWidget {
  RideBox(
      {super.key, this.price,
        this.text,
        this.onTap,
        this.onInfo,
        required this.selected,
        this.vehicleImage,
        this.vehicleName});

  void Function()? onTap;
  void Function()? onInfo;
  final String? text;
  bool selected = false;
  final String? vehicleName;
  final String? vehicleImage;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: selected == true
          ? Container(
        height: 90.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: whiteColor,
          border:
          Border.all(width: .50.w, color: greyColor.withOpacity(.3)),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              vehicleName!,

            ),
            addHeight(6.h),
            SvgPicture.asset(vehicleImage ?? "",
                height: 35.h, width: 49.w),
          ],
        ),
      )
          : Container(
        width: 100.w,
        padding: EdgeInsets.only(top: 4.h, left: 6.w, right: 8.w),
        margin: EdgeInsets.only(right: 5.w),
        decoration: BoxDecoration(
          color: Color(0xFFE8E4F2),
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 12.r,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ], //BoxShadow

          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(vehicleImage ?? "",
                    height: 30.h, width: 44.w),
                addWidth(10.w),
                GestureDetector(
                    onTap: onInfo,
                    child: Icon(
                      Icons.info_outline,
                      size: 20.sp,
                      color: primaryColor,
                    ))
              ],
            ),
            addHeight(10.h),
            Text(
              "Rs.${price}",
            ),
          ],
        ),
      ),
    );
  }
}
