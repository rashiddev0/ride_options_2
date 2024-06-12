import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_state.dart';
import 'package:ride_options_2/passenger_features/home_feature/presentation/view/components/fare_sheet.dart';

import '../../../../../common/const/export.dart';

class FareField extends StatelessWidget {
  FareField({
    super.key,
    this.userOffer,
    this.recommendedFare,
  });

  int? userOffer;
  int? recommendedFare;

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
            child: Container(
              alignment: Alignment.center,
              width: 295.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                      width: 1.w,
                      color: Theme.of(context).colorScheme.inverseSurface)),
              child: Row(
                children: [
                  addWidth(16.w),
                  Text(
                    "${homeBloc.selectedRideIndex == null
                        ? AppLocalizations.of(context)!.fare
                        : homeBloc.fareController.text.isEmpty
                        ? AppLocalizations.of(context)!.recommendedFare
                        : AppLocalizations.of(context)!.yourOffer
                    }:",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Spacer(),
                  Text(
                    homeBloc.selectedRideIndex == null
                        ? "PKR.${AppLocalizations.of(context)!.offerAPrice}"
                        : homeBloc.fareController.text.isEmpty
                            ? "PKR.$recommendedFare"
                            : "PKR.$userOffer",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  addWidth(16.w),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  //isScrollControlled: true,
                  enableDrag: true,
                  useSafeArea: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  builder: (BuildContext context) {
                    return FareSheet(
                      recommendedFare: recommendedFare,
                    );
                  });
            });
      },
    );
  }
}
