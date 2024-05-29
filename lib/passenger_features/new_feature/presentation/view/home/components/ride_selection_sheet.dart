import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/passenger_features/new_feature/data/models/location.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/ride_box.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/saved_address_model.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/whereToContainer.dart';

import '../../../../../../common/const/export.dart';
import '../../../../../../common/custom_widgets/custom_locationfield.dart';
import '../../../bloc/homeBloc/home_event.dart';
import '../../../bloc/homeBloc/home_state.dart';
import 'categoryBox.dart';
import 'place_serch_bottom_sheet.dart';

class RideSelectionSheet extends StatelessWidget {
  ScrollController scrollController;

  RideSelectionSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    LocationModel pickLocationModel;
    LocationModel dropLocationModel;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener

      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), // Adjust the radius as needed
              topRight: Radius.circular(16.r), // Adjust the radius as needed
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            children: [
              addHeight(8.h),
              Padding(
                padding: EdgeInsets.only(left: 170.w, right: 170.w),
                child: SizedBox(
                  width: 50,
                  child: Divider(
                    thickness: 5,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              addHeight(3.h),
              Visibility(
                visible: homeBloc.dropLocationController.text.isNotEmpty ? false : true,
                child: WhereToContainer(
                  locationHistory: homeBloc.locationHistory.isNotEmpty
                      ? homeBloc.locationHistory
                      : [],
                  //onTap: ()=> const PlaceSearchSheet(),
                  onTap: () async {
                    if (homeBloc.pickLocationMap.isEmpty) {
                      homeBloc.add(GetLocation());
                    } else {
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
              addHeight(12.h),
              Visibility(
                visible: homeBloc.dropLocationController.text.isNotEmpty ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w,right: 25.w),
                  child: CustomLocationField(
                    image: AppAssets.icLocationA,
                    readOnly: true,
                    controller: homeBloc.pickLocationController,
                    hintText: homeBloc.pickLocationController.text.isNotEmpty
                        ? homeBloc.pickLocationController.text
                        : "Current Location",
                    icon: Icons.clear,
                    colorIcon: Theme.of(context).colorScheme.shadow,
                    iconTap: () {
                      homeBloc.pickLocationController.clear();
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
                visible: homeBloc.dropLocationController.text.isNotEmpty ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w,right: 25.w),
                  child: CustomLocationField(
                    image: AppAssets.icLocationB,
                    readOnly: true,
                    controller: homeBloc.dropLocationController,
                    hintText: homeBloc.pickLocationController.text.isNotEmpty
                        ? homeBloc.pickLocationController.text
                        : AppLocalizations.of(context)!.to,
                    icon: Icons.clear,
                    colorIcon: Theme.of(context).colorScheme.shadow,
                    onChange: (value) {
                      homeBloc.getLocPrediction(value);
                      if (homeBloc.dropLocationController.text.isEmpty) {
                        homeBloc.dropLocationController.clear();
                      }
                      print("////55////${homeBloc.dropLocationController.text}");
                    },
                    iconTap: () {
                      homeBloc.pickLocationController.clear();
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
              addHeight(20.h),
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h, right: 6.w),
                        child: InkWell(
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 19.5,
                          ),
                          onTap: (){
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                onChanged: (date) {
                                  print('change $date');
                                },
                                onConfirm: (date) {
                                  print('confirm $date');
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.now,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: themeCubit.isDarkMode
                            ? AppColors.darkBlack
                            : AppColors.black,
                        size: 19.5,
                      ),
                      addWidth(16.w),
                    ],
                  ),
                ],
              ),
              addHeight(6.h),
              Expanded(
                flex: 2,
                child: SizedBox(
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
              ),
              addHeight(20.h),
              addWidth(16.w),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  AppLocalizations.of(context)!.ourServices,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              addHeight(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategoryBox(
                    categoryName: AppLocalizations.of(context)!.cityRides,
                    categoryImage: AppAssets.bike,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.locationMapScreen);
                    },
                  ),
                  CategoryBox(
                    categoryName: AppLocalizations.of(context)!.courier,
                    categoryImage: AppAssets.courier,
                    onTap: () {},
                  ),
                  CategoryBox(
                    categoryName: AppLocalizations.of(context)!.cityToCity,
                    categoryImage: AppAssets.cityToCity,
                    onTap: () {},
                  ),
                ],
              ),
              addHeight(20.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  AppLocalizations.of(context)!.savedAddresses,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              addHeight(6.h),
              Expanded(
                flex: 2,
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
            ],
          ),
        );
      },
    );
  }
}
