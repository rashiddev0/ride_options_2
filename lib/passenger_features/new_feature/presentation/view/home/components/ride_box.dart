
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_bloc.dart';

import '../../../../../../common/const/export.dart';
import '../../../bloc/homeBloc/home_state.dart';

class RideBox extends StatelessWidget {
  RideBox(
      {super.key, this.price,
        this.text,
        this.onTap,
        this.onInfo,
        required this.selected,
        this.index,
        this.vehicleImage,
        this.vehicleName});

  void Function()? onTap;
  void Function()? onInfo;
  final String? text;
  bool selected = false;
  final String? vehicleName;
  final String? vehicleImage;
  final int? price;
  int? index;

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return GestureDetector(
      onTap: onTap,
      child: selected == true
          ? Container(
        width: 120.w,
        padding: EdgeInsets.only(top: 4.h, left: 6.w, right: 8.w),
        margin: EdgeInsets.only(right: 5.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary,
              spreadRadius: homeBloc.selectedRideIndex == null || homeBloc.selectedRideIndex != index ? 0.r : -12.r,
              blurRadius: homeBloc.selectedRideIndex == null || homeBloc.selectedRideIndex != index ? 0.r : 10.r,
              offset: homeBloc.selectedRideIndex == null || homeBloc.selectedRideIndex != index ? Offset(0, 0.r) : Offset(0, 10.r), // changes position of shadow
            ),
          ], //BoxShadow

          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addHeight(10.h),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(vehicleImage ?? "",
                      height: 31.h, width: 66.w,
                    fit: BoxFit.cover,
                  ),
                  addWidth(10.w),
                  GestureDetector(
                      onTap: onInfo,
                      child: Icon(
                        Icons.info_outline,
                        size: 20.sp,
                        color: primaryColor,
                      ))
                ],
              ),
            ),
            addHeight(10.h),
            Text(
              "Rs.$price",
            ),
          ],
        ),
      )
          : Container(
        height: 120.h,
        width: 120.w,
        decoration: BoxDecoration(
          color: whiteColor,
          border:
          Border.all(width: .50.w, color: greyColor.withOpacity(.3)),
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
        ),
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              vehicleName!,
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            addHeight(6.h),
            SvgPicture.asset(vehicleImage ?? "",
                height: 45.h, width: 66.w),
          ],
        ),
      ),
    );
  },
);
  }
}
