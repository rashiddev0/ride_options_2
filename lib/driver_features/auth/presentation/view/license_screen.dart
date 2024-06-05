import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../component/driver_details_tile.dart';
import '../component/file_picker.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'dart:ui' as ui;



class LicenseScreen extends StatelessWidget {

  const LicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read< DriverAuthCubit>().setDataLicenseInit();
    return Directionality(
        textDirection: ui.TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.driving_license,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: BlocBuilder<DriverAuthCubit, DriverAuthState>(

            builder: (context, state) {
              return Column(
                children: [
                  addHeight(30.h),
                  FilePicker(
                    size: true,
                    img: state.imageFileLicense1,
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
                        context.read<DriverAuthCubit>().selectImageLicense(true,selectedFile);
                      }

                    },
                  ),
                  addHeight(24.h),
                  FilePicker(
                    size: true,
                    img: state.imageFileLicense2,
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
                        context.read< DriverAuthCubit>().selectImageLicense(false,selectedFile);
                      }

                    },
                  ),
                  addHeight(24.h),
                  DriverDetailTile(
                    onTap: () async {
                      context.read<DriverAuthCubit>().selectDate(context);
                    },
                    title: DateFormat("MM/dd/yyyy")
                        .format(state.dateTime ?? DateTime.now())
                        .toString(),
                    icon2: "",
                    icon: AppAssets.arrowForward,
                  ),
                  addHeight(32.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read< DriverAuthCubit>().setDataLicenseOnPress(context);
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

