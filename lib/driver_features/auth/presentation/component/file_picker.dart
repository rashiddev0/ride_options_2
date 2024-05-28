import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/const/export.dart';
import '../../../../common/custom_widgets/custom_button.dart';


// ignore: must_be_immutable
class FilePicker extends StatelessWidget {
  final XFile? img;
  final bool size;
  final String title;
  VoidCallback onTap;
  final String hintImg;
  FilePicker(
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
          height: 204.h ,
          width: 361.w,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12.r),
            dashPattern: [10, 10],
            color: greyColor,
            strokeWidth: 2.w,
            child: size
                ? Center(
              child: img == null
                  ? SizedBox(
                  width: 352.w,
                  height: 204.h,
                  child: SvgPicture.asset(
                    AppAssets.driverIcon,
                  ))
                  : SizedBox(
                height:204.h,
                width:  352.w,
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
          left:img == null? 96.w:200.w,

          child: SizedBox(
              width:img == null? 163.w:80.w,
              height:img == null? 60.h:65.h,
              child:   img == null?
              ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Theme.of(context).colorScheme.onPrimaryContainer,
                    surfaceTintColor:  Theme.of(context).colorScheme.onPrimaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 5.0, // Shadow effect
                  ),
                  child:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.add_photo,
                        style: TextStyle(color: AppColors.primary,fontSize: 14),
                      ),
                      Icon(Icons.add, color: AppColors.primary),
                    ],
                  )
              ):
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  shadowColor: Colors.black,
                  elevation: 5.0, // Shadow effect
                ),
                child:  Icon(Icons.edit, color: AppColors.primary),


              )
          )
          ,
        )

      ],
    );
  }
}
