
import 'package:image_picker/image_picker.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../component/driver_image_picker.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';



class BasicInfoScreen extends StatelessWidget {
  BasicInfoScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController referralIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read< DriverAuthCubit>().setDataBasicInit();
    return BlocBuilder<DriverAuthCubit, DriverAuthState>(
      builder: (context, state) {



        fullNameController.text=state.fullName??"";
        referralIdController.text=state.referralId??"";

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
                    img: state.profileImage,
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
                        context.read< DriverAuthCubit>().selectImageProfile(true,selectedFile);
                      }


                    },
                  ),
                  addHeight(30.h),
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.full_name,
                      suffixIcon: fullNameController.text.isNotEmpty
                          ? GestureDetector(
                        onTap: () {
                          fullNameController.clear();
                          context.read<DriverAuthCubit>().updateBasicName('');
                        },
                        child: SvgPicture.asset(
                          AppAssets.cancle,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                          : const SizedBox(),
                    ),
                    onChanged: (value) {
                      context.read<DriverAuthCubit>().updateBasicName(value);
                    },
                  ),
                  addHeight(12.h),
                  TextField(
                    controller: referralIdController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.referral_id,
                      suffixIcon: referralIdController.text.isNotEmpty
                          ? GestureDetector(
                        onTap: () {
                          referralIdController.clear();
                          context.read<DriverAuthCubit>().updateBasicReferral('');
                        },
                        child: SvgPicture.asset(
                          AppAssets.cancle,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                          : const SizedBox(),
                    ),
                    onChanged: (value) {
                      context.read<DriverAuthCubit>().updateBasicReferral(value);
                    },
                  ),
                  addHeight(150.h),
                  ElevatedButton(
                    onPressed: () {

                      context.read< DriverAuthCubit>().setDataBasicOnPress(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  addHeight(59.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

