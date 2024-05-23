import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/const/export.dart';

import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/custom_widgets/custom_button.dart';
import '../../../../common/custom_widgets/custom_textfield.dart';
import '../component/file_picker.dart';



class CNICScreen extends StatelessWidget {

  final TextEditingController CNICNumber=TextEditingController();
  XFile? imageFile;
  XFile? imageFile2;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.cnic,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 16.w),
        child: Column(
          children: [
            addHeight(30.h),
            FilePicker(
              size: true,
              img: imageFile,
              onTap: () async {

                XFile?  selectedFile = await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  // barrierDismissible: false,

                  builder: (BuildContext context) {
                    return ChoosePhotoSheet();
                  },
                );
                if (selectedFile != null) {
                  imageFile = selectedFile;
                }


              },),

            addHeight(24.h),
            FilePicker(
              size: true,
              img: imageFile,
              onTap: () async {

                XFile?  selectedFile = await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  // barrierDismissible: false,

                  builder: (BuildContext context) {
                    return ChoosePhotoSheet();
                  },
                );
                if (selectedFile != null) {
                  imageFile = selectedFile;
                }


              },),


            addHeight(24.h),
            CustomTextField(
              controller: CNICNumber,
              hintText: AppLocalizations.of(context)!.cnic,
              onChange: (value){
              },
              suffixIcon:CNICNumber.text.isNotEmpty? GestureDetector(
                onTap: (){
                  CNICNumber.clear();
                },
                child: SvgPicture.asset(
                  AppAssets.cancle,
                  fit: BoxFit.scaleDown,
                ),
              ):const SizedBox(),
            ),



            addHeight(32.h),
            CustomButton(title: AppLocalizations.of(context)!.save, onTap: () {  },width: 360.w,height: 54.h,bgColor: AppColors.primary.withOpacity(.1),
              borderColor:AppColors.primary.withOpacity(.1),textColor: AppColors.lightGray,),




          ],
        ),
      ),
    );
  }
}
