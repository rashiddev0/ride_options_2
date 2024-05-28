import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../const/export.dart';

class UtilityFunction{

  //***************** This Function Get Image from Gallery ************************ */
  Future<XFile?> getFromGallery() async {
    XFile? imageFile;

    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
    }
    return imageFile;
  }

//***************** This Function Get Image from Camera ************************ */
  Future<XFile?> getFromCamera() async {
    XFile? imageFile;
    PermissionStatus permissionStatus = await Permission.camera.request();
    if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
      await openAppSettings();
    } else {

      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        imageFile = XFile(pickedFile.path);
      }
        }

    return imageFile;
  }







  DateTime selectedDate = DateTime.now();

  Future<DateTime> selectDate(BuildContext context) async {
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
                  selectedDate = newDate;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
    return selectedDate;
  }


  Future<DateTime> selectYear(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 380.h,
                child: YearPicker(
                  firstDate: DateTime(DateTime.now().year - 100, 1),
                  lastDate: DateTime(DateTime.now().year + 100, 1),
                  initialDate: DateTime.now(),

                  selectedDate: selectedDate,
                  onChanged: (DateTime dateTime) {

                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
    return selectedDate;
  }



}