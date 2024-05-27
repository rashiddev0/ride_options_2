import 'package:ride_options_2/common/custom_widgets/custom_locationfield.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_state.dart';

import '../../../../../../common/const/export.dart';

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
          if (state is GetLocationPrediction) {}
        },
        builder: (context, state) {
          //homeBloc.locationPassed();
          return Column(
            children: [
              addHeight(8.h),
              Container(
                height: 4.h,
                width: 100.w,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              addHeight(12.h),
              CustomLocationField(
                image: AppAssets.icLocationA,
                controller: homeBloc.pickLocationController,
                hintText: homeBloc.pickLocationController.text.isNotEmpty
                    ? homeBloc.pickLocationController.text
                    : "Current Location",
                iconTap: () {
                  Navigator.pushNamed(context, AppRoute.dragMarkerScreen);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomLocationField(
                image: AppAssets.icLocationB,
                controller: homeBloc.dropLocationController,
                hintText: homeBloc.dropLocationController.text.isNotEmpty
                    ? homeBloc.dropLocationController.text
                    : AppLocalizations.of(context)!.to,
                onChange: (value) {
                  homeBloc.getLocPrediction(value);
                  if (homeBloc.dropLocationController.text.isEmpty) {
                    homeBloc.dropLocationController.clear();
                  }
                  print("////55////${homeBloc.dropLocationController.text}");
                },
                iconTap: () {
                  Navigator.pushNamed(context, AppRoute.dragMarkerScreen);
                },
              ),
              addHeight(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addWidth(16.w),
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
                          ),
                        ),
                        TextSpan(
                          text: '"${homeBloc.dropLocationController.text}"',
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
                  addWidth(16.w),
                ],
              ),
              Expanded(
                flex: 2,
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
                          homeBloc.placeList[index]["structured_formatting"]
                              ["main_text"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          homeBloc.placeList[index]["description"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
