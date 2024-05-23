import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/const/export.dart';

import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/custom_widgets/custom_button.dart';
import '../../../../common/custom_widgets/custom_textfield.dart';
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

            DriverDetailTile(onTap: () {
              _selectDate(context);

            }, title:selectedDate.toString()?? AppLocalizations.of(context)!.expiry_date, icon2: "", icon: AppAssets.arrowForward,),



            addHeight(32.h),
            CustomButton(title: AppLocalizations.of(context)!.save, onTap: () {  },width: 360.w,height: 54.h,bgColor: AppColors.primary.withOpacity(.1),
              borderColor:AppColors.primary.withOpacity(.1),textColor: AppColors.lightGray,),




          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: Text('Done'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
