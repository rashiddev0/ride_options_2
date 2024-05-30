



import 'package:image_picker/image_picker.dart';

abstract class DriverAuthState {
  final XFile? imageFile1;
  final XFile? imageFile2;
  final DateTime? dateTime;

  DriverAuthState({this.imageFile1, this.imageFile2,  this.dateTime});
}



class DriverBasicAuthInitial extends DriverAuthState {
  DriverBasicAuthInitial();
}

class DriverBasicImageAuthImageSelected extends DriverAuthState {
  DriverBasicImageAuthImageSelected({XFile? imageFile1, String? fullName,String? referralId});
}

class DriverBasicNameAuthDateSelected extends DriverAuthState {
  DriverBasicNameAuthDateSelected({XFile? imageFile1, String? fullName,String? referralId});
}


class DriverBasicReferralAuthDateSelected extends DriverAuthState {
  DriverBasicReferralAuthDateSelected({XFile? imageFile1, String? fullName,String? referralId});
}

class DriverBasicAuthError extends DriverAuthState {
  final String error;

  DriverBasicAuthError(this.error) ;
}







class DriverLicenseAuthInitial extends DriverAuthState {
  DriverLicenseAuthInitial() : super(dateTime: DateTime.now());
}

class DriverLicenseAuthImageSelected extends DriverAuthState {
  DriverLicenseAuthImageSelected({super.imageFile1, super.imageFile2, required DateTime super.dateTime});
}

class DriverLicenseAuthDateSelected extends DriverAuthState {
  DriverLicenseAuthDateSelected({required DateTime super.dateTime, super.imageFile1, super.imageFile2});
}

class DriverLicenseAuthError extends DriverAuthState {
  final String error;

  DriverLicenseAuthError(this.error) : super(dateTime: DateTime.now());
}


class DriverCNICAuthInitial extends DriverAuthState {
  DriverCNICAuthInitial() : super(dateTime: DateTime.now());
}

class DriverCNICAuthImageSelected extends DriverAuthState {
  DriverCNICAuthImageSelected({String? cNICNumber,super.imageFile1, super.imageFile2, });
}

class DriverCNICAuthDateSelected extends DriverAuthState {
  DriverCNICAuthDateSelected({String? cNICNumber, super.imageFile1, super.imageFile2});
}

class DriverCNICAuthError extends DriverAuthState {
  final String error;

  DriverCNICAuthError(this.error) : super(dateTime: DateTime.now());
}