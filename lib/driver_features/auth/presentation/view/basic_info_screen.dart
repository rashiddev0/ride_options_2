import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/const/export.dart';

import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/custom_widgets/custom_button.dart';
import '../../../../common/custom_widgets/custom_textfield.dart';
import '../component/driver_details_tile.dart';
import '../component/driver_image_picker.dart';
import 'dart:io';

class BasicInfoScreen extends StatefulWidget {
  BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final TextEditingController fullName=TextEditingController();

  final TextEditingController referralId=TextEditingController();
  XFile? imageFile;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.basic_info,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 16.w),
        child: Column(
          children: [
            addHeight(30.h),
            DriverImagePicker(
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
                 setState(() {
                   imageFile = selectedFile;
                 });
               }


            },),

            addHeight(30.h),
            CustomTextField(
              controller: fullName,
              hintText: AppLocalizations.of(context)!.full_name,
              onChange: (value){
                  setState(() {});
              },
              suffixIcon:fullName.text.isNotEmpty? GestureDetector(
                onTap: (){
                  fullName.clear();
                  setState(() {});
                },
                child: SvgPicture.asset(
                  AppAssets.cancle,
                  fit: BoxFit.scaleDown,
                ),
              ):const SizedBox(),
            ),
            addHeight(12.h),
            CustomTextField(
                controller: referralId,
                hintText: AppLocalizations.of(context)!.referral_id,
               onChange: (value){
                 setState(() {});
               },
               suffixIcon:referralId.text.isNotEmpty? GestureDetector(
                onTap: (){
                  referralId.clear();
                  setState(() {});
                },
                 child: SvgPicture.asset(
                   AppAssets.cancle,
                   fit: BoxFit.scaleDown,
                 ),
              ):const SizedBox(),


            ),

            addHeight(150.h),
            CustomButton(title: AppLocalizations.of(context)!.save, onTap: () {  },width: 360.w,height: 54.h,bgColor: AppColors.primary.withOpacity(.1),
              borderColor:AppColors.primary.withOpacity(.1),textColor: AppColors.lightGray,),
            addHeight(59.h),



          ],
        ),
      ),
    );
  }
}
