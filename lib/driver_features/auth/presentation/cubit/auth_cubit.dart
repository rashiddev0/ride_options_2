import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/models/value_item.dart';

import '../../../../common/const/export.dart';
import '../component/yearly_date_picker.dart';
import 'auth_state.dart';


class DriverAuthCubit extends Cubit<DriverAuthState> {

  DriverAuthCubit() : super(DriverBasicAuthInitial());





  ///************ Basic Info ****************************///

  void selectImageProfile(bool isImage1,XFile pickedFile) async {
    try {
      if (isImage1) {
        emit(DriverBasicImageAuthImageSelected(profileImage: pickedFile, fullName:state.fullName,referralId:state.referralId ));
      }
    } catch (e) {
      emit(DriverCNICAuthError("Error selecting image"));
    }
  }




  void updateBasicName(String name) {
    emit(DriverBasicNameAuthDateSelected(profileImage:state.profileImage, fullName:name,referralId:state.referralId  ));
  }
  void updateBasicReferral(String referralId) {
    emit(DriverBasicReferralAuthDateSelected(profileImage:state.profileImage, fullName:state.fullName,referralId:referralId ));
  }



  clearBasicData(){
    emit(DriverBasicImageAuthImageSelected( ));
  }


  XFile? profileImage;
  String? fullName;
  String? referralId;

  setDataBasicOnPress(context){
    profileImage= state.profileImage;
    fullName=state.fullName;
    referralId=state.referralId;
    emit(DriverBasicImageAuthImageSelected(profileImage: state.profileImage, fullName:state.fullName,referralId:state.referralId ));
    Navigator.pop(context);
  }

  setDataBasicInit(){
    emit(DriverBasicImageAuthImageSelected(profileImage: profileImage, fullName:fullName,referralId:referralId ));
  }









  ///***************** CNIC **********************///

  void selectImageCNIC(bool isImage1, XFile? pickedFile) async {
    try {
      if (pickedFile != null) {
        if (isImage1) {
          emit(DriverCNICAuthImageSelected(imageFileCNIC1: pickedFile, imageFileCNIC2: state.imageFileCNIC2, cnicNumber: state.cnicNumber));
        } else {
          emit(DriverCNICAuthImageSelected(imageFileCNIC1: state.imageFileCNIC1, imageFileCNIC2: pickedFile,cnicNumber: state.cnicNumber ));
        }
      }
    } catch (e) {
      emit(DriverCNICAuthError("Error selecting image"));
    }
  }

  void updateCnicNumber(String cnicNumber) {
    emit(DriverCNICAuthImageSelected(imageFileCNIC1:state.imageFileCNIC1, imageFileCNIC2:state.imageFileCNIC2,cnicNumber: cnicNumber ));
  }




  clearCNICData(){
    emit(DriverCNICAuthImageSelected( ));
  }


  XFile? imageFileCNIC1;
  XFile? imageFileCNIC2;
  String? cnicNumber;

  setDataCNICOnPress(context){
    imageFileCNIC1= state.imageFileCNIC1;
    imageFileCNIC2=state.imageFileCNIC2;
    cnicNumber=state.cnicNumber;
    emit(DriverCNICAuthImageSelected(imageFileCNIC1: imageFileCNIC1, imageFileCNIC2: imageFileCNIC2, cnicNumber: cnicNumber));
    Navigator.pop(context);
  }

  setDataCNICInit(){
    emit(DriverCNICAuthImageSelected(imageFileCNIC1: imageFileCNIC1, imageFileCNIC2: imageFileCNIC2, cnicNumber: cnicNumber));
  }








  ///***************** License **********************///



  void selectImageLicense(bool isImage1,XFile? pickedFile ) async {
    try {
      if (pickedFile != null) {
        if (isImage1) {
          emit(DriverLicenseAuthImageSelected(imageFileLicense1: pickedFile, imageFileLicense2: state.imageFileLicense2, dateTime: state.dateTime??DateTime.now()));
        } else {
          emit(DriverLicenseAuthImageSelected(imageFileLicense1: state.imageFileLicense1, imageFileLicense2: pickedFile, dateTime: state.dateTime??DateTime.now()));
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
      emit(DriverLicenseAuthDateSelected(dateTime: pickedDate, imageFileLicense1: state.imageFileLicense1, imageFileLicense2: state.imageFileLicense2));
    }
  }

  clearLicenseData(){
    emit(DriverLicenseAuthImageSelected(dateTime: DateTime.now() ));
  }


  XFile? imageFileLicense1;
  XFile? imageFileLicense2;
  DateTime? licenseDateTime;

  setDataLicenseOnPress(context){
    imageFileLicense1= state.imageFileLicense1;
    imageFileLicense2=state.imageFileLicense2;
    licenseDateTime=state.dateTime;
    emit(DriverLicenseAuthImageSelected(imageFileLicense1: imageFileLicense1, imageFileLicense2: imageFileLicense2, dateTime: licenseDateTime??DateTime.now()));
    Navigator.pop(context);
  }

  setDataLicenseInit(){
    emit(DriverLicenseAuthImageSelected(imageFileLicense1: imageFileLicense1, imageFileLicense2: imageFileLicense2, dateTime: licenseDateTime??DateTime.now()));
  }










  ///************* Vehicle Info *****************///




  void selectBrand(ValueItem brand) {
    emit( DriverVehicleInfoAuthSelected(selectedBrand: brand, selectedModel: state.selectedModel, vehicleModelDate: state.vehicleModelDate??DateTime.now()));
  }

  void selectModel(ValueItem model) {
    emit(DriverVehicleInfoAuthSelected(selectedBrand: state.selectedBrand, selectedModel: model,vehicleModelDate: state.vehicleModelDate??DateTime.now()));
  }


  void selectVehicleModel(BuildContext context) async {
    DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) => YearPickerDialog(
        initialDate: state.vehicleModelDate ?? DateTime.now(),
        onYearSelected: (DateTime selectedDate) {
          emit(DriverVehicleInfoAuthSelected(
            selectedBrand: state.selectedBrand,
            selectedModel: state.selectedModel,
            vehicleModelDate: selectedDate,
          ));
        },
      ),
    );
  }



  clearVehicleInfoData(){
    emit(DriverVehicleInfoAuthSelected(vehicleModelDate:DateTime.now()));
  }


  ValueItem? selectedBrand;
  ValueItem? selectedModel;
  DateTime? vehicleModelDate;

  setDataVehicleInfoOnPress(context){
    selectedBrand= state.selectedBrand;
    selectedModel=state.selectedModel;
    vehicleModelDate=state.vehicleModelDate;
    emit(DriverVehicleInfoAuthSelected(selectedBrand: selectedBrand, selectedModel: selectedModel, vehicleModelDate: vehicleModelDate??DateTime.now()));
    Navigator.pop(context);
  }

  setDataVehicleInfoInit(){
    emit(DriverVehicleInfoAuthSelected(selectedBrand: selectedBrand, selectedModel: selectedModel, vehicleModelDate: vehicleModelDate??DateTime.now()));
  }









  ///************* Vehicle Photo *****************///


  void selectVehiclePhoto(bool isImage1, XFile? pickedFile) async {
    try {
      if (pickedFile != null) {
        if (isImage1) {
          emit(DriverVehiclePhotoAuthSelected(vehicleImage: pickedFile, vehicleDoc: state.vehicleDoc, vehicleRegNumber: state.vehicleRegNumber,vehicleColor: state.vehicleColor));
        } else {
          emit(DriverVehiclePhotoAuthSelected(vehicleImage: state.vehicleImage, vehicleDoc: pickedFile,vehicleRegNumber: state.vehicleRegNumber ,vehicleColor: state.vehicleColor));
        }
      }
    } catch (e) {
      emit(DriverCNICAuthError("Error selecting image"));
    }
  }


  selectVehicleColor(Color vehicleColor){
    emit(DriverVehiclePhotoAuthSelected(vehicleImage: state.vehicleImage, vehicleDoc: state.vehicleDoc,vehicleRegNumber: state.vehicleRegNumber ,vehicleColor: vehicleColor));
  }


  setVehicleRegistration(String regNumber) {
    emit(DriverVehiclePhotoAuthSelected(vehicleImage: state.vehicleImage, vehicleDoc: state.vehicleDoc,vehicleRegNumber: regNumber ,vehicleColor: state.vehicleColor));
  }



}
