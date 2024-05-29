import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';

import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../component/driver_image_picker.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final TextEditingController fullName = TextEditingController();

  final TextEditingController referralId = TextEditingController();
  XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.basic_info,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Column(
            children: [
              addHeight(30.h),
              DriverImagePicker(
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
                    setState(() {
                      imageFile = selectedFile;
                    });
                  }
                },
              ),
              addHeight(30.h),
              TextField(
                controller: fullName,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.full_name,
                  suffixIcon: fullName.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            fullName.clear();
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            AppAssets.cancle,
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      : const SizedBox(),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              addHeight(12.h),
              TextField(
                controller: referralId,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.referral_id,
                  suffixIcon: referralId.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            referralId.clear();
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            AppAssets
                                .cancle, // Correct the typo from 'cancle' to 'cancel'
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      : const SizedBox(),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              addHeight(150.h),
              ElevatedButton(
                  onPressed: null,
                  child: Text(
                    AppLocalizations.of(context)!.save,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              addHeight(59.h),
            ],
          ),
        ),
      ),
    );
  }
}
