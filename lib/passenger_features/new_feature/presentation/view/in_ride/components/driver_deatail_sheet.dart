import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/in_ride_map_bloc/in_ride_map_bloc.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/in_ride_map_bloc/in_ride_map_state.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/in_ride/components/ride_Detail_sheet.dart';

import '../../../../../../common/const/export.dart';

class DriverDetailsSheet extends StatelessWidget {
  ScrollController scrollController = ScrollController();

  DriverDetailsSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final inRideMapBloc = BlocProvider.of<InRideMapBloc>(context);
    return BlocConsumer<InRideMapBloc, InRideMapState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: (){
            showModalBottomSheet(
                context: context,
                //isScrollControlled: true,
                enableDrag: true,
                useSafeArea: true,
                backgroundColor:
                Theme.of(context).scaffoldBackgroundColor,
                builder: (BuildContext context) {
                  return const RideDetailsSheet();
                });
          },
          child: Container(
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
                addHeight(8.h),
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
                          "Zain \n coming in",
                          style: Theme.of(context).textTheme.titleLarge,
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
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(
                                        width: 4.w,
                                        color: Theme.of(context).primaryColor)),
                                child: Icon(
                                  Icons.comment,
                                  color: Theme.of(context).primaryColor,
                                  size: 21.h,
                                )),
                            addWidth(16.w),
                            Container(
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(
                                        width: 4.w,
                                        color: Theme.of(context).primaryColor)),
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
          ),
        );
      },
    );
  }
}
