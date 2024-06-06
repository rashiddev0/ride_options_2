import 'package:ride_options_2/passenger_features/ride_feature/presentation/bloc/in_ride_map_bloc/in_ride_map_event.dart';
import 'package:ride_options_2/passenger_features/ride_feature/presentation/view/components/ride_Detail_sheet.dart';
import 'package:ride_options_2/passenger_features/ride_feature/presentation/view/components/safty_option_sheet.dart';
import 'package:sheet/sheet.dart';

import '../../../../../../common/const/export.dart';
import '../../bloc/in_ride_map_bloc/in_ride_map_bloc.dart';
import '../../bloc/in_ride_map_bloc/in_ride_map_state.dart';

class DriverDetailsSheet extends StatelessWidget {
  //ScrollController scrollController = ScrollController();
  SheetController sheetController;

  DriverDetailsSheet({super.key, required this.sheetController});

  @override
  Widget build(BuildContext context) {
    final inRideMapBloc = BlocProvider.of<InRideMapBloc>(context);
    return BlocConsumer<InRideMapBloc, InRideMapState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is ShowRideDetails){

        }
      },
      builder: (context, state) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (sheetController.offset < 547) {
            inRideMapBloc.showRideDetails();
          }
          else if (sheetController.offset > 130) {
            inRideMapBloc.showRideDetails();
          }
        });
        return Directionality(
          textDirection: TextDirection.ltr,
          child: sheetController.offset <= 137
              ? Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(16.r), // Adjust the radius as needed
                      topRight:
                          Radius.circular(16.r), // Adjust the radius as needed
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: 8.h, left: 16.w, right: 16.w, bottom: 16.h),
                    physics: const ClampingScrollPhysics(),
                    //controller: scrollController,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 140.w, right: 140.w),
                        child: SizedBox(
                          width: 50,
                          child: Divider(
                            thickness: 5,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                      addHeight(16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: 0 > 1
                                ? Image.network("", fit: BoxFit.cover)
                                : Icon(
                                    Icons.account_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 80.h,
                                  ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "Zain ${AppLocalizations.of(context)!.comingIn}",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  )),
                              Text(
                                "4:37",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "LHR-2654",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 46.h,
                                      width: 46.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          border: Border.all(
                                              width: 4.w,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      child: Icon(
                                        Icons.comment,
                                        color: Theme.of(context).primaryColor,
                                        size: 21.h,
                                      )),
                                  addWidth(50.w),
                                  Container(
                                      height: 46.h,
                                      width: 46.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          border: Border.all(
                                              width: 4.w,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      child: Icon(
                                        Icons.call,
                                        color: Theme.of(context).primaryColor,
                                        size: 21.h,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(16.r), // Adjust the radius as needed
                      topRight:
                          Radius.circular(16.r), // Adjust the radius as needed
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: 8.h, left: 16.w, right: 16.w, bottom: 16.h),
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 120.w, right: 120.w),
                        child: SizedBox(
                          width: 50,
                          child: Divider(
                            thickness: 5,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                      addHeight(8.h),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Zain ${AppLocalizations.of(context)!.isOnTheWay}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.access_time_outlined,
                              size: 30.h,
                            ),
                            addWidth(6.w),
                            Text(
                              "4:37",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.bike,
                              height: 67.5.h,
                              width: 99,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Honda 70",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Container(
                                  width: 154.w,
                                  height: 51.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "LHR-2654",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                      ),
                      addHeight(16.h),
                      Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 46.h,
                                    width: 46.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            width: 3.w,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            //isScrollControlled: true,
                                            enableDrag: true,
                                            useSafeArea: true,
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            builder: (BuildContext context) {
                                              return const SaftyOptionSheet();
                                            });
                                      },
                                      child: Icon(
                                        Icons.health_and_safety_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 21.h,
                                      ),
                                    )),
                                Container(
                                    height: 46.h,
                                    width: 46.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            width: 3.w,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: Icon(
                                      Icons.comment,
                                      color: Theme.of(context).primaryColor,
                                      size: 21.h,
                                    )),
                                Container(
                                    height: 46.h,
                                    width: 46.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            width: 3.w,
                                            color: Theme.of(context)
                                                .primaryColor)),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                addWidth(32.w),
                                Icon(
                                  Icons.money_outlined,
                                  size: 30.h,
                                ),
                                addWidth(8.w),
                                Text(
                                  AppLocalizations.of(context)!.cash,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                const Spacer(),
                                Text(
                                  "${AppLocalizations.of(context)!.rs}. 130",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                addWidth(32.w),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoute.rideCancelScreen);
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
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer; // Color when button is pressed
                              }
                              return Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer; // Default color
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors
                                    .red; // Color when button is pressed
                              }
                              return Colors.red; // Default color
                            },
                          ),
                        ),
                        child: const Text("Cancel ride"),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
