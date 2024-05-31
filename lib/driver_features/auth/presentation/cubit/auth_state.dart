



import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/models/value_item.dart';

abstract class DriverAuthState {
  final XFile? imageFileCNIC1;
  final XFile? imageFileCNIC2;
  final XFile? imageFileLicense1;
  final XFile? imageFileLicense2;
  final XFile? profileImage;
  final DateTime? dateTime;
  final String? cnicNumber;
  final String? fullName;
  final String? referralId;
  final ValueItem? selectedBrand;
  final ValueItem? selectedModel;
  final DateTime? vehicleModelDate;
  final XFile? vehicleImage;
  final XFile? vehicleDoc;
  final Color? vehicleColor;
  final String? vehicleRegNumber;

  DriverAuthState({this.imageFileCNIC1, this.imageFileCNIC2,  this.dateTime,this.imageFileLicense1,
    this.imageFileLicense2,this.profileImage,this.cnicNumber,this.fullName,this.referralId,this.selectedBrand,
  this.selectedModel,this.vehicleModelDate,this.vehicleImage,this.vehicleColor,this.vehicleDoc,this.vehicleRegNumber
  });
}



class DriverBasicAuthInitial extends DriverAuthState {
  DriverBasicAuthInitial();
}

class DriverBasicImageAuthImageSelected extends DriverAuthState {
  DriverBasicImageAuthImageSelected({super.profileImage, super.fullName,super.referralId});
}

class DriverBasicNameAuthDateSelected extends DriverAuthState {
  DriverBasicNameAuthDateSelected({super.profileImage, super.fullName,super.referralId});
}


class DriverBasicReferralAuthDateSelected extends DriverAuthState {
  DriverBasicReferralAuthDateSelected({super.profileImage,super.fullName,super.referralId});
}

class DriverBasicAuthError extends DriverAuthState {
  final String error;

  DriverBasicAuthError(this.error) ;
}







class DriverLicenseAuthInitial extends DriverAuthState {
  DriverLicenseAuthInitial() : super(dateTime: DateTime.now());
}

class DriverLicenseAuthImageSelected extends DriverAuthState {
  DriverLicenseAuthImageSelected({super.imageFileLicense1, super.imageFileLicense2, required DateTime super.dateTime});
}

class DriverLicenseAuthDateSelected extends DriverAuthState {
  DriverLicenseAuthDateSelected({required DateTime super.dateTime, super.imageFileLicense1, super.imageFileLicense2});
}

class DriverLicenseAuthError extends DriverAuthState {
  final String error;

  DriverLicenseAuthError(this.error) : super(dateTime: DateTime.now());
}


class DriverCNICAuthInitial extends DriverAuthState {
  DriverCNICAuthInitial() : super(dateTime: DateTime.now());
}

class DriverCNICAuthImageSelected extends DriverAuthState {
  DriverCNICAuthImageSelected({super.cnicNumber,super.imageFileCNIC1, super.imageFileCNIC2, });
}

class DriverCNICAuthDateSelected extends DriverAuthState {
  DriverCNICAuthDateSelected({super.cnicNumber, super.imageFileCNIC1, super.imageFileCNIC2});
}

class DriverCNICAuthError extends DriverAuthState {
  final String error;

  DriverCNICAuthError(this.error) : super(dateTime: DateTime.now());
}



class  DriverVehicleInfoAuthInitial extends DriverAuthState {
  DriverVehicleInfoAuthInitial() : super(dateTime: DateTime.now());
}

class  DriverVehicleInfoAuthSelected extends DriverAuthState {
  DriverVehicleInfoAuthSelected({ required DateTime super.vehicleModelDate,super.selectedBrand, super.selectedModel});
}


class DriverVehiclePhotoAuthSelected extends DriverAuthState {
  DriverVehiclePhotoAuthSelected({super.vehicleImage, super.vehicleDoc, super.vehicleRegNumber,Color? vehicleColor});
}