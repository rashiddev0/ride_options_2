import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../const/export.dart';
import '../utils/utility_function.dart';
import 'custom_apptext.dart';



class ChoosePhotoSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          padding:
              EdgeInsets.only(top: 16.h, bottom: 32.h, left: 28.w, right: 28.w),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(12.r)),
          child: Center(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    XFile? file = await UtilityFunction().getFromCamera();
                    Navigator.pop(context, file);
                  },
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 12,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.camera,
                          width: 24.w,
                          height: 24.h,
                        ),
                        addWidth(8.w),
                        AppText("Pick from Camera", style: Theme.of(context).textTheme.bodyLarge! ,)
                      ],
                    ),
                  ),
                ),
                addHeight(15.h),
                GestureDetector(
                  onTap: () async {
                    XFile? file = await UtilityFunction().getFromGallery();
                    Navigator.pop(context, file);
                  },
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 12,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.gallery,
                          width: 24.w,
                          height: 24.h,
                        ),
                        addWidth(8.w),
                        AppText("Pick from Gallery", style: Theme.of(context).textTheme.bodyLarge!,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
