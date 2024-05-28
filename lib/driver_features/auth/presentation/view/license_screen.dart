import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ride_options_2/common/const/export.dart';

import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/custom_widgets/custom_button.dart';
import '../../../../common/custom_widgets/custom_textfield.dart';
import '../../../../common/utils/utility_function.dart';
import '../component/driver_details_tile.dart';
import '../component/file_picker.dart';



class LicenseScreen extends StatefulWidget {

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  final TextEditingController CNICNumber=TextEditingController();

  XFile? imageFile;

  XFile? imageFile2;
  UtilityFunction utilityFunction=UtilityFunction();
  DateTime dateTime=DateTime.now();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.driving_license,
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

            DriverDetailTile(onTap: () async {
             dateTime= await utilityFunction.selectDate(context);

            }, title:DateFormat("MM/dd/yyyy").format(DateTime.parse(dateTime.toString())).toString()?? AppLocalizations.of(context)!.expiry_date, icon2: "", icon: AppAssets.arrowForward,),



            addHeight(32.h),

            ElevatedButton(onPressed:null, child: Text(AppLocalizations.of(context)!.save,
              style:  Theme.of(context).textTheme.headlineMedium,
            )),



          ],
        ),
      ),
    );
  }


}
