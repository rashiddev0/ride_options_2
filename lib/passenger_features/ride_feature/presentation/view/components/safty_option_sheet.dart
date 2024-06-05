import '../../../../../../common/const/export.dart';
import 'emergency_assistance_sheet.dart';

class SaftyOptionSheet extends StatelessWidget {
  const SaftyOptionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), // Adjust the radius as needed
          topRight: Radius.circular(16.r), // Adjust the radius as needed
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(
            top: 8.h, left: 16.w, right: 16.w, bottom: 16.h),
        physics: const ClampingScrollPhysics(),
        children: [
          addHeight(8.h),
          Padding(
            padding: EdgeInsets.only(left: 140.w, right: 140.w),
            child: SizedBox(
              width: 50,
              child: Divider(
                thickness: 5,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          addHeight(8.h),
          SizedBox(
            width: 361.w,
              child: Text(
            AppLocalizations.of(context)!.safetyOptions,
            style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
          )),
          addHeight(8.h),
          SizedBox(
            width: 361.w,
              child: Text(
                AppLocalizations.of(context)!.dontWorry,
            style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
          )),
          addHeight(8.h),
          const Spacer(),
          Directionality(
            textDirection: TextDirection.ltr,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.rideCancelScreen);
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith<double?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return 0.5.r; // Color when button is pressed
                    }
                    return 0.5.r; // Default color
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context).colorScheme.onPrimaryContainer; // Color when button is pressed
                    }
                    return Theme.of(context).colorScheme.onPrimaryContainer; // Default color
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return AppColors.black; // Color when button is pressed
                    }
                    return AppColors.black; // Default color
                  },
                ),
              ),
              icon: Icon(Icons.emergency_share_outlined,size: 22.h,),
              label: Text(AppLocalizations.of(context)!.shareTripStatus),
            ),
          ),
          addHeight(8.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    //isScrollControlled: true,
                    enableDrag: true,
                    useSafeArea: true,
                    backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor,
                    builder: (BuildContext context) {
                      return const EmargencyAssistanceSheet();
                    });
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith<double?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return 0.5.r; // Color when button is pressed
                    }
                    return 0.5.r; // Default color
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context).colorScheme.onPrimaryContainer; // Color when button is pressed
                    }
                    return Theme.of(context).colorScheme.onPrimaryContainer; // Default color
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return AppColors.black; // Color when button is pressed
                    }
                    return AppColors.black; // Default color
                  },
                ),
              ),
              icon: Icon(Icons.add_alert,size: 22.h,),
              label: Text(AppLocalizations.of(context)!.emergencyAssist),
            ),
          ),
        ],
      ),
    );
  }
}
