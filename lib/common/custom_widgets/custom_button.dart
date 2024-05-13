// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  double? titleSize;
  double? borderRadius;
  final VoidCallback? onTap;

  Color? bgColor;
  Color? textColor;
  Color? borderColor;

  CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.borderRadius,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        //minimumSize: Size(337.w, 54.h),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!.r),
          side: onTap == null
              ? BorderSide.none
              : BorderSide(width: 1.w, color: borderColor!),
        ),
      ),
      onPressed: onTap,
      child: Text(
        title, //size: 16.sp, color: textColor
        style: TextStyle(fontSize: titleSize, color: textColor),
      ),
    );
  }
}
