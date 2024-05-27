import 'package:flutter/material.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/ride_box.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/whereToContainer.dart';

import '../../../../../../common/const/export.dart';
import '../../../bloc/homeBloc/home_event.dart';
import '../../../bloc/homeBloc/home_state.dart';
import 'categoryBox.dart';
import 'place_serch_bottom_sheet.dart';

class RideSelectionSheet extends StatelessWidget {
  const RideSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(

            children: [
              addHeight(8.h),
              InkWell(
                onTap: () {
                  homeBloc.showFullSheet();
                },
                child: Container(
                  height: 4.h,
                  width: 100.w,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              addHeight(12.h),
              WhereToContainer(
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
              addHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addWidth(16.w),
                  Text(
                    "Select a ride",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      addWidth(16.w),
                      Icon(Icons.calendar_month_outlined,color: Theme.of(context).primaryColor,size: 19.5,),
                      Text(
                        "Select a ride",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Icon(Icons.arrow_drop_down,color: themeCubit.isDarkMode ?
                      AppColors.darkBlack
                          : AppColors.black,size: 19.5,),
                      addWidth(16.w),
                    ],
                  ),
                ],
              ),
              addHeight(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RideBox(
                    selected: false,
                    vehicleName: AppLocalizations.of(context)!.cityRides,
                    vehicleImage: AppAssets.bike,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.locationMapScreen);
                    },
                  ),
                  RideBox(
                    selected: false,
                    vehicleName: AppLocalizations.of(context)!.courier,
                    vehicleImage: AppAssets.courier,
                    onTap: () {},
                  ),
                  RideBox(
                    selected: false,
                    vehicleName: AppLocalizations.of(context)!.cityToCity,
                    vehicleImage: AppAssets.cityToCity,
                    onTap: () {},
                  ),
                ],
              ),
              addHeight(20.h),
              addWidth(16.w),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  "Other services",
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
                  "Saved addresses",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
