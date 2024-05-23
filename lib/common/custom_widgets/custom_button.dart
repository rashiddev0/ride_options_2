// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import 'custom_apptext.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  double? titleSize;
  IconData? icon;
  //double? borderRadius;
  final VoidCallback? onTap;

  Color? bgColor;
  Color? textColor;
  Color? borderColor;
  double? width;
  double? height;

  CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    //required this.borderRadius,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.titleSize,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize:width!=null && height !=null? Size(width??337.w, height??54.h):null,
        backgroundColor: bgColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: onTap == null
              ? BorderSide.none
              : BorderSide(width: 1.w, color: borderColor??AppColors.primary),
        ),
      ),
      onPressed: onTap,
      icon: Icon(icon,color: textColor,size: 18.sp,),

      label: Text(
        title, //size: 16.sp, color: textColor
        style: TextStyle(fontSize: titleSize, color: textColor),

      ),
    );
  }
}
