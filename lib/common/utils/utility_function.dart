import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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


}