import 'package:flutter/cupertino.dart';
import 'package:ride_options_2/common/custom_widgets/custom_locationfield.dart';
import 'package:ride_options_2/common/custom_widgets/custom_textfield.dart';

import '../../../../../common/const/export.dart';
import '../bloc/homeBloc/home_bloc.dart';
import 'components/comment_model.dart';
import 'components/place_serch_bottom_sheet.dart';
import 'components/user_waiting_sheet.dart';

class CourierScreen extends StatelessWidget {
  const CourierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.courier),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppLocalizations.of(context)!.sender}:",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              addHeight(8.h),
              SizedBox(
                  width: 361.w,
                  child: CustomLocationField(
                    controller: homeBloc.pickLocationController,
                    readOnly: true,
                    image: AppAssets.icLocationA,
                    hintText: homeBloc.pickLocationController.text.isNotEmpty
                        ? homeBloc.pickLocationController.text
                        : "pick location",
                    icon: homeBloc.pickLocationController.text.isNotEmpty
                    ? Icons.clear
                    : Icons.location_on_outlined,
                    colorIcon: homeBloc.pickLocationController.text.isNotEmpty
                    ? Theme.of(context).colorScheme.shadow
                      : Theme.of(context).primaryColor,
                    onTap: (){
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
                  )),
              addHeight(8.h),
              SizedBox(
                  width: 361.w,
                  child: CustomTextField(
                    controller: homeBloc.userCommentController,
                    hintText: AppLocalizations.of(context)!.senderPhoneNumber,
                    visible: true,
                  )),
              addHeight(24.h),
              Text(
                "${AppLocalizations.of(context)!.receiver}:",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              addHeight(8.h),
              SizedBox(
                  width: 361.w,
                  child: CustomLocationField(
                    controller: homeBloc.dropLocationController,
                    readOnly: true,
                    image: AppAssets.icLocationB,
                    hintText: homeBloc.dropLocationController.text.isNotEmpty
                        ? homeBloc.dropLocationController.text
                        : AppLocalizations.of(context)!.whereToDeliver,
                    icon: homeBloc.dropLocationController.text.isNotEmpty
                    ? Icons.clear
                    : Icons.location_on_outlined,
                    colorIcon: homeBloc.dropLocationController.text.isNotEmpty
                        ? Theme.of(context).colorScheme.shadow
                        : Theme.of(context).primaryColor,
                    onTap: (){
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
                  )),
              addHeight(8.h),
              SizedBox(
                  width: 361.w,
                  child: CustomTextField(
                    controller: homeBloc.userCommentController,
                    hintText: AppLocalizations.of(context)!.receiverPhoneNumber,
                    visible: true,
                  )),
              addHeight(24.h),
              Text(
                "${AppLocalizations.of(context)!.deliverBy}:",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                children: [
                  addWidth(16.w),
                  Container(
                    height: 40.67.h,
                    width: 49.33.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    child: SvgPicture.asset(
                      AppAssets.courierBike,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  addWidth(7.w),
                  Text(
                    AppLocalizations.of(context)!.bike,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  addWidth(16.w),
                ],
              ),
              addHeight(8.h),
              Row(
                children: [
                  addWidth(16.w),
                  Container(
                    height: 40.67.h,
                    width: 49.33.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    child: SvgPicture.asset(
                      AppAssets.auto,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  addWidth(7.w),
                  Text(
                    AppLocalizations.of(context)!.auto,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  addWidth(16.w),
                ],
              ),
              addHeight(6.h),
              TextFormField(
                maxLines: 4,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                    border: OutlineInputBorder(
                      // Add border
                      borderSide: BorderSide(
                          width: 0.5.w,
                          color: homeBloc.pickLocationController.text.isNotEmpty
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor),
                      borderRadius:
                          BorderRadius.circular(12.r), // Add border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.w, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    hintText: AppLocalizations.of(context)!.description,
                    // Hint text
                    hintStyle: Theme.of(context).textTheme.bodyMedium),
              ),
              addHeight(8.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    addWidth(6.w),
                    CommentModel(comments: "Books"),

                    CommentModel(comments: "Keys"),

                    CommentModel(comments: "Box"),

                    CommentModel(comments: "Tiffin box"),

                  ],
                ),
              ),
              addHeight(24.h),
              SizedBox(
                height: 62.h,
                width: 361.w,
                child: ElevatedButton.icon(
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
                  icon: Icon(Icons.search,size: 22.h,color: Theme.of(context).colorScheme.onPrimaryContainer,),
                  label: Text(AppLocalizations.of(context)!.findDriver),
                ),
              ),
              addHeight(6.h),
            ],
          ),
        ),
      ),
    );
  }
}
