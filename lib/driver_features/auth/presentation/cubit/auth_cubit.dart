import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/const/export.dart';
import 'auth_state.dart';


class DriverAuthCubit extends Cubit<DriverAuthState> {
  final ImagePicker _picker = ImagePicker();

  DriverAuthCubit() : super(DriverLicenseAuthInitial());

  void selectImageLicense(bool isImage1) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (isImage1) {
          emit(DriverLicenseAuthImageSelected(imageFile1: pickedFile, imageFile2: state.imageFile2, dateTime: state.dateTime??DateTime.now()));
        } else {
          emit(DriverLicenseAuthImageSelected(imageFile1: state.imageFile1, imageFile2: pickedFile, dateTime: state.dateTime??DateTime.now()));
        }
      }
    } catch (e) {
      emit(DriverLicenseAuthError("Error selecting image"));
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: state.dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      emit(DriverLicenseAuthDateSelected(dateTime: pickedDate, imageFile1: state.imageFile1, imageFile2: state.imageFile2));
    }
  }








  void selectImageCNIC(bool isImage1) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (isImage1) {
          emit(DriverCNICAuthImageSelected(imageFile1: pickedFile, imageFile2: state.imageFile2, ));
        } else {
          emit(DriverCNICAuthImageSelected(imageFile1: state.imageFile1, imageFile2: pickedFile, ));
        }
      }
    } catch (e) {
      emit(DriverCNICAuthError("Error selecting image"));
    }
  }

  void updateCnicNumber(String cnicNumber) {
    emit(DriverCNICAuthImageSelected(imageFile1:state.imageFile1, imageFile2:state.imageFile2,cNICNumber: cnicNumber ));
  }

  void selectImageProfile(bool isImage1) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (isImage1) {
          emit(DriverBasicImageAuthImageSelected(imageFile1: pickedFile, ));
        }
      }
    } catch (e) {
      emit(DriverCNICAuthError("Error selecting image"));
    }
  }












  void updateBasicName(String name) {
    emit(DriverCNICAuthImageSelected(imageFile1:state.imageFile1, imageFile2:state.imageFile2,cNICNumber: name ));
  }
  void updateBasicReferral(String referralId) {
    emit(DriverCNICAuthImageSelected(imageFile1:state.imageFile1, imageFile2:state.imageFile2,cNICNumber: referralId ));
  }
}
