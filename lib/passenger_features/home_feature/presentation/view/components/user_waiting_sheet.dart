import 'package:lottie/lottie.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';

import '../../../../../../common/const/export.dart';

class UserWaitingSheet extends StatelessWidget {
  const UserWaitingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), // Adjust the radius as needed
          topRight: Radius.circular(16.r), // Adjust the radius as needed
        ),
      ),
      child: Column(
        children: [
          Center(
            child: Lottie.asset(AppAssets.userWaiting,
                fit: BoxFit.fill, repeat: true, height: 200.h, width: 200.w),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.inRideMap, (route) => false);
              },
              child: Text(AppLocalizations.of(context)!.cancelRide)),
          /*CustomButton(title: AppLocalizations.of(context)!.cancelRide, onTap: (){
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.inRideMap, (route) => false);
          },
    borderColor: Theme.of(context).primaryColor,),*/
          addHeight(16.h),
        ],
      ),
    );
  }
}
