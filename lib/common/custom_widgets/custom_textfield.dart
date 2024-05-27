

// ignore: must_be_immutable
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_options_2/common/const/strings.dart';
import '../const/export.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        required this.controller,
        this.visible = false,
        required this.hintText,
        this.onChange,
        this.focusNode,
        this.suffixIcon,
        this.onTap,
        this.keyboardType = TextInputType.text});

  TextEditingController controller = TextEditingController();
  bool visible;
  String hintText;
  void Function(String)? onChange;
  FocusNode? focusNode;
  Widget? suffixIcon;
  TextInputType keyboardType;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      height: 60.h,
      child: TextFormField(
        // cursorHeight: 20.h,
        // textAlign: TextAlign.center,
        focusNode: focusNode,
        onChanged: onChange,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        onTap: onTap,

        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: keyboardType, // Set keyboard type to number

        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
            prefixIcon: visible
                ? SizedBox(
              width: 90.w,
              height: 20.h,
              child: Row(
                children: [
                  addWidth(5.w),
                  SvgPicture.asset(
                    AppAssets.pakistanFlag,
                    width: 22.5.w,
                    height: 15.5.h,
                  ),
                  addWidth(4.w),
                  Text(
                    AppStrings.plus92,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  addWidth(6.w),
                  Container(
                    width: 1.w, // Width of the vertical line
                    height:
                    20.h, // Height should match the height of the row
                    color: Theme.of(context).primaryColor, // Color of the vertical line
                  ),
                ],
              ),
            )
                : null,
            border: OutlineInputBorder(
              // Add border
              // borderSide: BorderSide(width: 0.5.w, color: controller.text.isNotEmpty ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(12.r), // Add border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12.r),
            ),
            hintText: hintText, // Hint text
            hintStyle: Theme.of(context).textTheme.bodyMedium
        ),
      ),
    );
  }
}