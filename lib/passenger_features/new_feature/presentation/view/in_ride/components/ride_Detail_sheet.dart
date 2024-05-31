import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/in_ride/components/safty_option_sheet.dart';

import '../../../../../../common/const/export.dart';

class RideDetailsSheet extends StatelessWidget {
  const RideDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
              addWidth(40.w),
              Text("Zain is on the way",style: Theme.of(context).textTheme.titleMedium,),
              const Spacer(),
              Icon(Icons.access_time_outlined,size: 30.h,),
              Text("4:37",style: Theme.of(context).textTheme.headlineMedium,),
              addWidth(40.w),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.bike,height: 67.5.h,width: 99,),
              Column(
                children: [
                  Text("Honda 70",style: Theme.of(context).textTheme.bodyMedium,),
                  Container(
                    width: 154.w,
                    height: 51.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Theme.of(context).colorScheme.onPrimaryContainer
                    ),
                    child: Text("LHR-2654",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                              width: 3.w,
                              color: Theme.of(context).primaryColor)),
                      child: InkWell(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              //isScrollControlled: true,
                              enableDrag: true,
                              useSafeArea: true,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
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
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                              width: 3.w,
                              color: Theme.of(context).primaryColor)),
                      child: Icon(
                        Icons.comment,
                        color: Theme.of(context).primaryColor,
                        size: 21.h,
                      )),
                  Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                              width: 3.w,
                              color: Theme.of(context).primaryColor)),
                      child: Icon(
                        Icons.call,
                        color: Theme.of(context).primaryColor,
                        size: 21.h,
                      )),
                ],
              ),
              addHeight(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  addWidth(32.w),
                  Icon(Icons.money_outlined,size: 30.h,),
                  addWidth(8.w),
                  Text("Cash",style: Theme.of(context).textTheme.headlineMedium,),
                  const Spacer(),
                  Text("Rs. 130",style: Theme.of(context).textTheme.headlineMedium,),
                  addWidth(32.w),

                ],
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
            child: ListTile(
              leading: Image.asset(AppAssets.pickPin,height: 22.h,width: 22.w,),
              title: Text("Faiz Rd 23, Muslim town",style: Theme.of(context).textTheme.bodyLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
              subtitle: Text("Faiz Rd 23, Muslim town. Faiz Rd 23, adl5364",style: Theme.of(context).textTheme.labelMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              leading: Image.asset(AppAssets.dropPin,height: 22.h,width: 22.w,),
              title: Text("Jay Bee’s, Link road, Model town",style: Theme.of(context).textTheme.bodyLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
              subtitle: Text("Jay Bee’s, Link road, Model townJay Bee’s, Link",style: Theme.of(context).textTheme.labelMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
          ),
          CustomButton(title: "Cancel ride", onTap: (){
            Navigator.pushNamed(context, AppRoute.rideCancelScreen);
          },borderColor: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}
