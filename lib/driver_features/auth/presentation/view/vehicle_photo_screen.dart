import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';

import '../../../../common/const/export.dart';
import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/utils/utility_function.dart';
import '../component/color_circular_option.dart';
import '../component/file_picker.dart';

// ignore: must_be_immutable
class VehiclePhotoScreen extends StatelessWidget {
  VehiclePhotoScreen({super.key});

  final TextEditingController regNumber = TextEditingController();

  XFile? imageFile;

  XFile? imageFile2;
  UtilityFunction utilityFunction = UtilityFunction();
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.vehicle_photo,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Column(
              children: [
                addHeight(30.h),
                FilePicker(
                  size: true,
                  img: imageFile,
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
                      imageFile = selectedFile;
                    }
                  },
                ),
                addHeight(12.h),
                TextField(
                  controller: regNumber,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.registration_number,
                    suffixIcon: regNumber.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              regNumber.clear();
                            },
                            child: SvgPicture.asset(
                              AppAssets.cancle,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        : const SizedBox(),
                  ),
                  onChanged: (value) {
                    // Handle onChanged logic here if needed
                  },
                ),
                addHeight(12.h),
                Container(
                  width: 361.w,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 20.r,
                        offset: Offset(0, 20.h),
                        spreadRadius: -25.r,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.select_color,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        addHeight(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ColorCircularOption(
                              Colors.white,
                              AppLocalizations.of(context)!.white,
                            ),
                            ColorCircularOption(
                              Colors.grey,
                              AppLocalizations.of(context)!.silver,
                            ),
                            ColorCircularOption(
                              Colors.black,
                              AppLocalizations.of(context)!.black,
                            ),
                            ColorCircularOption(
                              Colors.grey.shade800,
                              AppLocalizations.of(context)!.grey,
                            ),
                            ColorCircularOption(
                              Colors.blue,
                              AppLocalizations.of(context)!.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                addHeight(24.h),
                FilePicker(
                  size: true,
                  img: imageFile,
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
                      imageFile = selectedFile;
                    }
                  },
                ),
                addHeight(24.h),
                ElevatedButton(
                    onPressed: null,
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
