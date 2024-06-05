import 'package:ride_options_2/common/custom_widgets/custom_locationfield.dart';
import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_event.dart';

import '../../../../../../common/const/export.dart';
import '../../bloc/homeBloc/home_bloc.dart';
import '../../bloc/homeBloc/home_state.dart';

class PlaceSearchSheet extends StatelessWidget {
  const PlaceSearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          //homeBloc.locationPassed();
          return Padding(
            padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Container(
                  height: 4.h,
                  width: 100.w,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                addHeight(12.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomLocationField(
                    image: AppAssets.icLocationA,
                    readOnly: false,
                    focusNode: FocusNode(canRequestFocus: false),
                    controller: homeBloc.pickLocationController,
                    hintText: homeBloc.pickLocationController.text.isNotEmpty
                        ? homeBloc.pickLocationController.text
                        : "Current Location",
                    onChange: (value) {
                      homeBloc.checkLocationTextController(true);
                      homeBloc.getLocPrediction(value);
                    },
                    icon: homeBloc.pickLocationController.text.isNotEmpty
                        ? Icons.clear
                        : Icons.location_on_outlined,
                    colorIcon: homeBloc.pickLocationController.text.isNotEmpty
                        ? Theme.of(context).colorScheme.shadow
                        : Theme.of(context).primaryColor,
                    iconTap: () {
                      if (homeBloc.pickLocationController.text.isEmpty) {
                        homeBloc.checkLocationTextController(true);
                        Navigator.pushNamed(context, AppRoute.dragMarkerScreen);
                      } else {
                        homeBloc.clearPickLocation(homeBloc.pickLocationController,homeBloc.pickLocationMap);
                      }
                    },
                  ),
                ),
                addHeight(8.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomLocationField(
                    image: AppAssets.icLocationB,
                    readOnly: false,
                    focusNode: FocusNode(canRequestFocus: false),
                    controller: homeBloc.dropLocationController,
                    hintText: homeBloc.dropLocationController.text.isNotEmpty
                        ? homeBloc.dropLocationController.text
                        : AppLocalizations.of(context)!.to,
                    icon: homeBloc.dropLocationController.text.isNotEmpty
                        ? Icons.clear
                        : Icons.location_on_outlined,
                    colorIcon: homeBloc.dropLocationController.text.isNotEmpty
                        ? Theme.of(context).colorScheme.shadow
                        : Theme.of(context).primaryColor,
                    onChange: (value) {
                      homeBloc.checkLocationTextController(false);
                      homeBloc.getLocPrediction(value);
                      /*if(state is PickLocationController){
                        print("///72///${state.pickLocController}");
                      }*/
                      if (homeBloc.dropLocationController.text.isEmpty) {
                        homeBloc.dropLocationController.clear();
                      }
                    },
                    iconTap: () {
                      if (homeBloc.dropLocationController.text.isEmpty) {
                        homeBloc.checkLocationTextController(false);
                        Navigator.pushNamed(context, AppRoute.dragMarkerScreen);
                      } else {
                        homeBloc.clearPickLocation(homeBloc.dropLocationController,homeBloc.dropLocationMap);
                      }
                    },
                  ),
                ),
                addHeight(6.5.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${AppLocalizations.of(context)!.resultsFor}\t\t",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '"${homeBloc.dropLocationController.text.length <= 10 ? homeBloc.dropLocationController.text : homeBloc.dropLocationController.text.substring(0, 8)}..."',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${homeBloc.placeList.length} ${AppLocalizations.of(context)!.found}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 0.2,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Visibility(
                    visible: homeBloc.placeList.isNotEmpty ? true : false,
                    child: Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: size.height,
                        width: size.width,
                        child: ListView.separated(
                          itemCount: homeBloc.placeList.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.history),
                              title: Text(
                                homeBloc.placeList[index]
                                    ["structured_formatting"]["main_text"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                homeBloc.placeList[index]["description"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              onTap: () async {
                                Navigator.pop(context);
                                //loadingAlertDialog(context: context);
                                if (homeBloc.pickLocationTextController == true) {
                                  await homeBloc.getLatLngFromAddress(
                                      homeBloc.placeList, index);
                                  if (context.mounted) {
                                    homeBloc.pickLocationController.text =
                                        homeBloc.placeList[index]
                                            ["description"];
                                    //Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, AppRoute.locationMapScreen);
                                  }
                                } else if (homeBloc.pickLocationTextController == false) {
                                  await homeBloc.getLatLngFromAddressDrop(
                                      homeBloc.placeList, index);
                                  homeBloc.dropLocationController.text =
                                  homeBloc.placeList[index]
                                  ["description"];
                                  if (context.mounted) {
                                    //Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, AppRoute.locationMapScreen);
                                    homeBloc.setLocation();
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
