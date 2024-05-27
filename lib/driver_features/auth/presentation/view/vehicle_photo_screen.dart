import 'package:image_picker/image_picker.dart';

import '../../../../common/const/export.dart';
import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/custom_widgets/custom_button.dart';
import '../../../../common/custom_widgets/custom_textfield.dart';
import '../../../../common/utils/utility_function.dart';
import '../component/color_circular_option.dart';
import '../component/driver_details_tile.dart';
import '../component/file_picker.dart';

class VehiclePhotoScreen extends StatelessWidget {
   VehiclePhotoScreen({Key? key}) : super(key: key);

  final TextEditingController regNumber=TextEditingController();

  XFile? imageFile;

  XFile? imageFile2;
  UtilityFunction utilityFunction=UtilityFunction();
  DateTime dateTime=DateTime.now();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.vehicle_photo,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              addHeight(12.h),
          CustomTextField(
            controller: regNumber,
            hintText: AppLocalizations.of(context)!.registration_number,
            onChange: (value){
        
            },
            suffixIcon:regNumber.text.isNotEmpty? GestureDetector(
              onTap: (){
                regNumber.clear();
              },
              child: SvgPicture.asset(
                AppAssets.cancle,
                fit: BoxFit.scaleDown,
              ),
            ):const SizedBox(),),
              addHeight(12.h),
        
        
              Container(
                width: 361.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 20.r,
                      offset: Offset(0, 20.h),
                      spreadRadius: -25.r,
                    ),
                  ],),

                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 24.h),
                  child: Column(children: [
                    Text( AppLocalizations.of(context)!.select_color,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    addHeight(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ColorCircularOption(Colors.white,  AppLocalizations.of(context)!.white,),
                        ColorCircularOption(Colors.grey,  AppLocalizations.of(context)!.silver,),
                        ColorCircularOption(Colors.black,  AppLocalizations.of(context)!.black,),
                        ColorCircularOption(Colors.grey.shade800,  AppLocalizations.of(context)!.grey,),
                        ColorCircularOption(Colors.blue,  AppLocalizations.of(context)!.blue,),
                      ],
                    ),
                  ],),
                ),
        
              ),
        
        
        
        
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
              CustomButton(title: AppLocalizations.of(context)!.save, onTap: () {  },width: 360.w,height: 54.h,bgColor: AppColors.primary.withOpacity(.1),
                borderColor:AppColors.primary.withOpacity(.1),textColor: AppColors.lightGray,),
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }






}
