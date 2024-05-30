import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import '../../../../common/custom_widgets/choose_photo_sheet.dart';
import '../../../../common/utils/utility_function.dart';
import '../component/driver_details_tile.dart';
import '../component/file_picker.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';


class LicenseScreen extends StatelessWidget {
  const LicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverAuthCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.driving_license,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: BlocBuilder< DriverAuthCubit,  DriverAuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  addHeight(30.h),
                  FilePicker(
                    size: true,
                    img: state.imageFile1,
                    onTap: () {
                      context.read< DriverAuthCubit>().selectImageLicense(true);
                    },
                  ),
                  addHeight(24.h),
                  FilePicker(
                    size: true,
                    img: state.imageFile2,
                    onTap: () {
                      context.read< DriverAuthCubit>().selectImageLicense(false);
                    },
                  ),
                  addHeight(24.h),
                  DriverDetailTile(
                    onTap: () {
                      context.read< DriverAuthCubit>().selectDate(context);
                    },
                    title: DateFormat("MM/dd/yyyy")
                        .format(state.dateTime??DateTime.now())
                        .toString(),
                    icon2: "",
                    icon: AppAssets.arrowForward,
                  ),
                  addHeight(32.h),
                  ElevatedButton(
                      onPressed: () {


                      },
                      child: Text(
                        AppLocalizations.of(context)!.save,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
