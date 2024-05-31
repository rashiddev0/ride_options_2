

import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../component/file_picker.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';



class CNICScreen extends StatelessWidget {
  final TextEditingController CNICNumber = TextEditingController();
  XFile? imageFile;
  XFile? imageFile2;

  CNICScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read< DriverAuthCubit>().setDataCNICInit();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.cnic,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: BlocBuilder<DriverAuthCubit, DriverAuthState>(
            builder: (context, state) {

              CNICNumber.text=state.cnicNumber??"";

              return Column(
                children: [
                  addHeight(30.h),
                  FilePicker(
                    size: true,
                    img: state.imageFileCNIC1,
                    onTap: () async {
                      XFile? selectedFile = await showModalBottomSheet(
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
                        context.read< DriverAuthCubit>().selectImageCNIC(true,selectedFile);
                      }
                    },
                  ),
                  addHeight(24.h),
                  FilePicker(
                    size: true,
                    img: state.imageFileCNIC2,
                    onTap: () async {

                      XFile? selectedFile = await showModalBottomSheet(
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
                        context.read< DriverAuthCubit>().selectImageCNIC(false,selectedFile);
                      }
                    },
                  ),
                  addHeight(24.h),
                  TextField(
                    controller: CNICNumber,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.cnic,
                      suffixIcon: CNICNumber.text.isNotEmpty
                          ? GestureDetector(
                        onTap: () {
                          CNICNumber.clear();
                          context.read<DriverAuthCubit>().updateCnicNumber('');
                        },
                        child: SvgPicture.asset(
                          AppAssets.cancle,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                          : const SizedBox(),
                    ),
                    onChanged: (value) {
                      context.read<DriverAuthCubit>().updateCnicNumber(value);
                    },
                  ),
                  addHeight(32.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read< DriverAuthCubit>().setDataCNICOnPress(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

