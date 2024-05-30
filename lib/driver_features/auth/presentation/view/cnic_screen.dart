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
    return
      BlocProvider(
          create: (context) => DriverAuthCubit(),
          child:
          Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                appBar: CustomAppBar(
                  title: Text(
                    AppLocalizations.of(context)!.cnic,
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  child:

                  BlocBuilder< DriverAuthCubit,  DriverAuthState>(
                      builder: (context, state) {
                        return

                          Column(
                            children: [
                              addHeight(30.h),

                              FilePicker(
                                size: true,
                                img: state.imageFile1,
                                onTap: () {
                                  context.read< DriverAuthCubit>().selectImageCNIC(true);
                                },
                              ),


                              addHeight(24.h),

                              FilePicker(
                                size: true,
                                img: state.imageFile2,
                                onTap: () {
                                  context.read<DriverAuthCubit>().selectImageCNIC(false);
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
                                  onPressed: null,
                                  child: Text(
                                    AppLocalizations.of(context)!.save,
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  )),
                            ],
                          );}
                  ),
                ),
              )));
  }
}
