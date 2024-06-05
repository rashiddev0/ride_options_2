import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/const/export.dart';

// ignore: must_be_immutable
class DriverImagePicker extends StatelessWidget {
  final XFile? img;
  final bool size;
  final String title;
  VoidCallback onTap;
  final String hintImg;
  DriverImagePicker(
      {super.key,
      this.img,
      this.size = false,
      required this.onTap,
      this.title = "Font Side",
      this.hintImg = "CNIC Image"});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 234.h,
          width: 234.h,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12.r),
            dashPattern: const [10, 10],
            color: greyColor,
            strokeWidth: 2.w,
            child: size
                ? Center(
                    child: img == null
                        ? SizedBox(
                            width: 185.w,
                            height: 190.h,
                            child: SvgPicture.asset(
                              AppAssets.driverIcon,
                            ))
                        : SizedBox(
                            height: 235.h,
                            width: 235.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                File(img!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  )
                : Center(
                    child: img == null
                        ? SizedBox(
                            width: size ? 185.w : 235.w,
                            height: size ? 190.h : 130.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset(
                                hintImg,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: size ? 185.w : 235.w,
                            height: size ? 190.h : 130.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                File(img!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ),
          ),
        ),
        Positioned(
          bottom: 6.h,
          left: img == null ? 18.w : 120.w,
          child: SizedBox(
              width: img == null ? 163.w : 60.w,
              height: img == null ? 60.h : 65.h,
              child: img == null
                  ? ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        surfaceTintColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        shadowColor: Colors.black,
                        elevation: 5.0, // Shadow effect
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.add_photo,
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          Icon(Icons.add, color: AppColors.primary),
                        ],
                      ))
                  : ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        surfaceTintColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        shadowColor: Colors.black,
                        elevation: 5.0, // Shadow effect
                      ),
                      child: Icon(Icons.edit, color: AppColors.primary),
                    )),
        )
      ],
    );
  }
}
