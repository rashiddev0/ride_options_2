import 'package:geolocator/geolocator.dart';
import 'package:ride_options_2/passenger_features/home_feature/data/models/location.dart';

import '../../../../../common/const/export.dart';
import '../../../../../passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';

class DriverRideDetailSheet extends StatelessWidget {
  const DriverRideDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), // Adjust the radius as needed
          topRight: Radius.circular(16.r), // Adjust the radius as needed
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 8.h,left: 16.w,right: 16.w,bottom: 16.h),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.iconMale,height: 70,width: 70,),
                    addWidth(10.w),
                    Text("Ali",style: Theme.of(context).textTheme.headlineLarge),
                    const Spacer(),
                    Container(
                        height: 46.h,
                        width: 46.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(100.r),
                          // border: Border.all(
                          //     width: 3.w,
                          //     color: Theme.of(context).primaryColor)
                        ),
                        child: Icon(
                          Icons.comment,
                          color: Theme.of(context).primaryColor,
                          size: 21.h,
                        )),
                    addWidth(10.w),
                    Container(
                        height: 46.h,
                        width: 46.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(100.r),
                          // border: Border.all(
                          //     width: 3.w,
                          //     color: Theme.of(context).primaryColor)
                        ),
                        child: Icon(
                          Icons.call,
                          color: Theme.of(context).primaryColor,
                          size: 21.h,
                        )),
                  ],
                ),
              ),
              addHeight(12.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(AppLocalizations.of(context)!.contactPassengerVia),
              )
            ],
          ),
          Expanded(
            flex: 2,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ListTile(
                leading: Image.asset(
                  AppAssets.pickPin,
                  height: 22.h,
                  width: 22.w,
                ),
                title: Text(
                  "Faiz Rd 23, Muslim town",
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "Faiz Rd 23, Muslim town. Faiz Rd 23, adl5364",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ListTile(
                leading: Image.asset(
                  AppAssets.dropPin,
                  height: 22.h,
                  width: 22.w,
                ),
                title: Text(
                  "Jay Bee’s, Link road, Model town",
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "Jay Bee’s, Link road, Model townJay Bee’s, Link",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              final homeBloc = BlocProvider.of<HomeBloc>(context);
              LocationModel loc = LocationModel.fromMap(homeBloc.pickLocationMap);
              double distanceInMeters = Geolocator.distanceBetween(loc.lat!, loc.lng!, 31.472915991413526, 74.38766107685493);
              debugPrint("///130///$distanceInMeters");
              //Navigator.pushNamed(context, AppRoute.rideCancelScreen);
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
                    return Theme.of(context).primaryColor; // Color when button is pressed
                  }else{
                    return Theme.of(context).primaryColor;
                  }
                  return Theme.of(context).primaryColor.withOpacity(0.10); // Default color
                },
              ),
            ),
            icon: const Icon(Icons.notifications,),
            label: Text(AppLocalizations.of(context)!.notifyPassenger),
          ),
          addHeight(8.h),
          ElevatedButton(
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
                    return Colors.red; // Color when button is pressed
                  }
                  return Colors.red; // Default color
                },
              ),
            ),
            child: const Text("Cancel ride"),
          ),
        ],
      ),
    );
  }
}
