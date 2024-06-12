import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../../../common/const/export.dart';
import '../../../common/custom_widgets/custom_locationfield.dart';
import '../../home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import '../../home_feature/presentation/view/components/categoryBox.dart';
import '../../home_feature/presentation/view/components/fare_faild.dart';
import '../../home_feature/presentation/view/components/place_serch_bottom_sheet.dart';
import '../../home_feature/presentation/view/components/ride_box.dart';
import '../../home_feature/presentation/view/components/user_waiting_sheet.dart';
import '../../home_feature/presentation/view/components/whereToContainer.dart';
import '../../ride_feature/presentation/view/components/option_sheet.dart';

class TestRideSelectionSheet extends StatelessWidget {
  ScrollController scrollController;
  String travelTime;

  TestRideSelectionSheet(
      {super.key, required this.travelTime, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), // Adjust the radius as needed
          topRight: Radius.circular(16.r), // Adjust the radius as needed
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w),
        physics: const ClampingScrollPhysics(),
        //controller: scrollController,
        children: [
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
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? false
                : true,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: WhereToContainer(
                locationHistory: homeBloc.locationHistory.isNotEmpty
                    ? homeBloc.locationHistory
                    : [],
                //onTap: ()=> const PlaceSearchSheet(),
                onTap: () async {
                  if (homeBloc.pickLocationMap.isEmpty) {
                    //homeBloc.add(GetLocation());
                  } else {
                    homeBloc.placeList.clear();
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: true,
                        useSafeArea: true,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        builder: (BuildContext context) {
                          return const PlaceSearchSheet();
                        });
                  }
                },
              ),
            ),
          ),
          addHeight(6.h),
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? true
                : false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CustomLocationField(
                image: AppAssets.icLocationA,
                readOnly: true,
                focusNode: FocusNode(canRequestFocus: false),
                controller: homeBloc.pickLocationController,
                hintText: homeBloc.pickLocationController.text.isNotEmpty
                    ? homeBloc.pickLocationController.text
                    : "Current Location",
                icon: Icons.clear,
                colorIcon: Theme.of(context).colorScheme.shadow,
                iconTap: () {},
                onTap: () {
                  homeBloc.placeList.clear();
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      enableDrag: true,
                      useSafeArea: true,
                      builder: (BuildContext context) {
                        return const PlaceSearchSheet();
                      });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? true
                : false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CustomLocationField(
                image: AppAssets.icLocationB,
                readOnly: true,
                focusNode: FocusNode(canRequestFocus: false),
                controller: homeBloc.dropLocationController,
                hintText: homeBloc.dropLocationController.text.isNotEmpty
                    ? homeBloc.dropLocationController.text
                    : AppLocalizations.of(context)!.to,
                icon: Icons.clear,
                colorIcon: Theme.of(context).colorScheme.shadow,
                onChange: (value) {
                  homeBloc.getLocPrediction(value);
                  if (homeBloc.dropLocationController.text.isEmpty) {
                    homeBloc.dropLocationController.clear();
                  }
                },
                iconTap: () {},
                onTap: () {
                  homeBloc.placeList.clear();
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      enableDrag: true,
                      useSafeArea: true,
                      builder: (BuildContext context) {
                        return const PlaceSearchSheet();
                      });
                },
              ),
            ),
          ),
          addHeight(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addWidth(16.w),
              Text(
                AppLocalizations.of(context)!.selectARide,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Spacer(),
              Row(
                children: [
                  addWidth(16.w),
                  InkWell(
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 19.5,
                    ),
                    onTap: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onChanged: (date) {
                            //print('change $date');
                          }, onConfirm: (date) {
                            //print('confirm $date');
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.en);
                    },
                  ),
                  Text(
                    AppLocalizations.of(context)!.now,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.inverseSurface,
                    size: 19.5,
                  ),
                  addWidth(16.w),
                ],
              ),
            ],
          ),
          addHeight(6.h),
          SizedBox(
            width: 120.w,
            height: 120.h,
            child: ListView.separated(
              itemCount: homeBloc.rideCategoryName.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.h),
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.w);
              },
              itemBuilder: (context, index) {
                return RideBox(
                  selected:
                  homeBloc.selectedRideIndex == index ? true : false,
                  vehicleName: homeBloc.rideCategoryName[index],
                  vehicleImage: homeBloc.rideCategoryImg[index],
                  index: index,
                  price: homeBloc.rideCategoryRate[index],
                  onTap: () {
                    homeBloc.getSelectedIndex(index);
                  },
                );
              },
            ),
          ),
          homeBloc.dropLocationController.text.isNotEmpty
              ? addHeight(0.h)
              : addHeight(20.h),
          homeBloc.dropLocationController.text.isNotEmpty
              ? addWidth(0.h)
              : addWidth(16.w),
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? false
                : true,
            child: Text(
              AppLocalizations.of(context)!.ourServices,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          homeBloc.dropLocationController.text.isNotEmpty
              ? addHeight(0.h)
              : addHeight(6.h),
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? false
                : true,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CategoryBox(
                      categoryName: AppLocalizations.of(context)!.cityRides,
                      categoryImage: AppAssets.bike,
                      onTap: () {},
                    ),
                    CategoryBox(
                      categoryName: AppLocalizations.of(context)!.courier,
                      categoryImage: AppAssets.courier,
                      onTap: () {},
                    ),
                    CategoryBox(
                      categoryName:
                      AppLocalizations.of(context)!.cityToCity,
                      categoryImage: AppAssets.cityToCity,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          homeBloc.dropLocationController.text.isNotEmpty
              ? addHeight(0.h)
              : addHeight(20.h),
          /*Visibility(
                visible: homeBloc.dropLocationController.text.isNotEmpty
                    ? false
                    : true,
                child: Text(
                  AppLocalizations.of(context)!.savedAddresses,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              addHeight(6.h),
              Visibility(
                visible: homeBloc.dropLocationController.text.isNotEmpty
                    ? false
                    : true,
                child: Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 150.h,
                    child: ListView.separated(
                      itemCount: homeBloc.locationHistory.length,
                      padding: EdgeInsets.all(10.h),
                      itemBuilder: (context, index) {
                        //return LocationHistoryTile(address: homeBloc.locationHistory[index],);
                        return Wrap(children: [
                          SavedAddressModel(
                            address: homeBloc.locationHistory[index],
                          ),
                        ]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10.w);
                      },
                    ),
                  ),
                ),
              ),*/
          addHeight(16.h),
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? true
                : false,
            child: Container(
              alignment: Alignment.center,
              width: 256.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(26.r),
              ),
              child: Text(
                  "${AppLocalizations.of(context)!.travelTimeApprox}.~ $travelTime"),
            ),
          ),
          addHeight(8.h),
          Visibility(
            visible: homeBloc.dropLocationController.text.isNotEmpty
                ? true
                : false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              /*child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      addWidth(6.w),
                      SizedBox(
                          height: 59.h,
                          width: 71.w,
                          child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                width: 75.w,
                                height: 31.h,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                        width: 1.w,
                                        color: Theme.of(context).primaryColor)),
                                child: Icon(Icons.tune_outlined,size: 22.h,color: Theme.of(context).colorScheme.onPrimaryContainer,),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    //isScrollControlled: true,
                                    enableDrag: true,
                                    useSafeArea: true,
                                    backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                    builder: (BuildContext context) {
                                      return OptionSheet(scrollController: scrollController);
                                    });
                              }),
                      ),
                      addWidth(6.w),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            height: 62.h,
                            width: 291.w,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.search,size: 22,),
                              label: Text(AppLocalizations.of(context)!.findDriver),
                              onPressed: (){
                                showModalBottomSheet(
                                    context: context,
                                    //isScrollControlled: true,
                                    enableDrag: true,
                                    useSafeArea: true,
                                    backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                    builder: (BuildContext context) {
                                      return const UserWaitingSheet();
                                    });
                              },
                            ),),
                      ),
                      addWidth(6.w),
                    ],
                  ),*/
              child: Column(
                children: [
                  Row(
                    children: [
                      FareField(
                        recommendedFare: homeBloc.selectedRideIndex == null
                            ? 0
                            : homeBloc.rideCategoryRate[
                        homeBloc.selectedRideIndex!],
                        userOffer: homeBloc.fareController.text.isEmpty ? 0 : int.parse(homeBloc.fareController.text),
                      ),
                      addWidth(6.w),
                      InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    width: 1.w,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface)),
                            child: Icon(
                              Icons.tune_outlined,
                              size: 26.h,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inverseSurface,
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                //isScrollControlled: true,
                                enableDrag: true,
                                useSafeArea: true,
                                backgroundColor: Theme.of(context)
                                    .scaffoldBackgroundColor,
                                builder: (BuildContext context) {
                                  return const OptionSheet();
                                });
                          }),
                      addWidth(6.w),
                    ],
                  ),
                  addHeight(8.h),
                  SizedBox(
                    height: 62.h,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.search,
                        size: 22,
                      ),
                      label: Text(AppLocalizations.of(context)!.findDriver),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            //isScrollControlled: true,
                            enableDrag: true,
                            useSafeArea: true,
                            backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                            builder: (BuildContext context) {
                              return const UserWaitingSheet();
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          addHeight(16.h),
        ],
      ),
    );
  }
}