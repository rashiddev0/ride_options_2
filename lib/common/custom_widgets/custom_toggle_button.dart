import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_options_2/common/const/colors.dart';

// ignore: must_be_immutable
class CustomToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged<int> onToggleCallback;
  final List<IconData?>? icons;
  bool showOnline;
  bool initialPosition;
  // final List<BoxShadow> shadows;

  CustomToggle(
      {super.key,
      required this.values,
      required this.onToggleCallback,
      this.icons,
      this.showOnline = false,
      this.initialPosition = true})
      : assert(icons == null || icons.length == values.length,
            'Icons and values must have the same length');

  @override
  // ignore: library_private_types_in_public_api
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 270.w,
        height: width * 0.13,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.initialPosition = !widget.initialPosition;
                var index = widget.initialPosition ? 0 : 1;
                widget.onToggleCallback(index);
                setState(() {});
              },
              //************** this button is  unselect or non_active***************** */
              child: Container(
                width: width * 1,
                height: 56.h,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    widget.values.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        children: [
                          if (widget.icons != null) ...[
                            Icon(widget.icons![index],
                                color: const Color(0xFF918f95)),
                            SizedBox(width: 8.w),
                          ],
                          Text(
                            widget.values[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //************** this button is select or active***************** */
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              alignment: widget.initialPosition
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(8.r),
                width: 120.w,
                height: 56.h,
                decoration: ShapeDecoration(
                  // color: widget.buttonColor,
                  color: widget.showOnline
                      ? widget.initialPosition
                          ? const Color(0xffFD5548)
                          : const Color(0xff8DC060)
                      : Theme.of(context).colorScheme.primary,
                  // shadows: widget.shadows,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icons != null) ...[
                      Icon(
                        widget.initialPosition
                            ? widget.icons![0]
                            : widget.icons![1],
                        color: AppColors.white,
                      ),
                      SizedBox(width: 8.w),
                    ],
                    Text(
                      widget.initialPosition
                          ? widget.values[0]
                          : widget.values[1],
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
