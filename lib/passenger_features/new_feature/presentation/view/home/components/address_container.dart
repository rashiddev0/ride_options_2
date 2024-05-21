/*
import 'package:rideoptions/Common/Component/consts/consts.dart';

class AddressContainer extends StatelessWidget {
  final String fromAddress;

  final VoidCallback fromOnTap;
  final String toAddress;

  final VoidCallback toOnTap;
  const AddressContainer({
    super.key,
    required this.fromAddress,
    required this.fromOnTap,
    required this.toAddress,
    required this.toOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        addWidth(14.w),
        SvgPicture.asset(
          icRidePickAndDrop,
          height: 82.h,
          width: 20.w,
        ),
        addWidth(14.w),
        Column(
          children: [
            CustomContainer(
              onTap: fromOnTap,
              address: fromAddress,
            ),
            addHeight(10.h),
            CustomContainer(
              onTap: toOnTap,
              address: toAddress,
            ),
          ],
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.onTap,
    required this.address,
  });

  final VoidCallback onTap;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 336.w,
        height: 55.h,
        padding: EdgeInsets.only(left: 10.w),
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(width: .5.w, color: primaryColor),
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            SizedBox(
              width: 300.w,
              child: Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle(
                    size: 16.sp, color: blackColor, weight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
