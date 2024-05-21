
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_options_2/common/const/add_gap.dart';
import 'package:ride_options_2/common/const/assets.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/cubit/home/home_cubit.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/cubit/home/home_state.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/categoryBox.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/offer_box.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/whereToContainer.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../../../../../common/const/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              addWidth(16.w),
              SvgPicture.asset(
                AppAssets.hamBurger,
                height: 24.h,
                width: 24.w,
              ),
              addWidth(138.w),
              SvgPicture.asset(
                AppAssets.logoAppBar,
              ),
              addWidth(130.w),
              SvgPicture.asset(
                AppAssets.icFilter,
                height: 24.h,
                width: 24.w,
              ),
              addWidth(16.w),
            ],
          )
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addHeight(16.h),
              WhereToContainer(
                  locationHistory: homeCubit.locationHistory.isNotEmpty
                      ? homeCubit.locationHistory
                      : [],
                  onTap: () {}),
              addHeight(16.h),
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Text(
                  "Our services",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              addWidth(4.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategoryBox(
                    categoryName: "City Rides",
                    categoryImage: AppAssets.bike,
                    onTap: () {},
                  ),
                  CategoryBox(
                    categoryName: "Courier",
                    categoryImage: AppAssets.courier,
                    onTap: () {},
                  ),
                  CategoryBox(
                    categoryName: "city to City",
                    categoryImage: AppAssets.cityToCity,
                    onTap: () {},
                  ),
                ],
              ),
              addHeight(16.h),
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Text(
                  "Top offers",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              addWidth(4.w),
              ScrollLoopAutoScroll(
                  scrollDirection: Axis.horizontal, //required
                  delay: const Duration(milliseconds: 10),
                  duration: const Duration(seconds: 200),
                  //gap: 25,
                  reverseScroll: false,
                  //duplicateChild : 25,
                  enableScrollInput : true,
                  delayAfterScrollInput : const Duration(milliseconds: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OfferBox(offerImage: "assets/imgs/temp/a.png",onTap: (){},),
                      OfferBox(offerImage: "assets/imgs/temp/b.png",onTap: (){},),
                      OfferBox(offerImage: "assets/imgs/temp/c.jpg",onTap: (){},),
                      OfferBox(offerImage: "assets/imgs/temp/d.jpg",onTap: (){},),
                      OfferBox(offerImage: "assets/imgs/temp/e.jpg",onTap: (){},),
                      OfferBox(offerImage: "assets/imgs/temp/f.jpg",onTap: (){},),
                    ],
                  )
              ),
              addHeight(16.h),
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Text(
                  "Coming soon",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              addWidth(4.w),
            ],
          );
        },
      ),
    );
  }
}
