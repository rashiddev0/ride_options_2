// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  //double? titleSize;
  IconData? icon;

  //double? borderRadius;
  final VoidCallback? onTap;

  //Color? bgColor;
  //Color? textColor;
  Color? borderColor;

  CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    //required this.borderRadius,
    //this.bgColor,
    //this.textColor,
    this.borderColor,
    //this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        //minimumSize: Size(337.w, 54.h),
        //backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: onTap == null
              ? BorderSide.none
              : BorderSide(width: 1.w, color: borderColor!),
        ),
      ),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Theme.of(context).scaffoldBackgroundColor,
        size: 22.h,
      ),
      label: Text(
        title, //size: 16.sp, color: textColor
        style: TextStyle(
            fontSize: 22.sp,
            color: Theme.of(context).scaffoldBackgroundColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
