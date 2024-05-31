import 'package:ride_options_2/common/const/add_gap.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';
import 'package:ride_options_2/common/custom_widgets/custom_locationfield.dart';
import 'package:ride_options_2/common/custom_widgets/custom_textfield.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/comment_model.dart';

import '../../../../../common/const/export.dart';
import '../home/components/user_waiting_sheet.dart';

class CourierScreen extends StatelessWidget {
  const CourierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courier"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sender:",style: Theme.of(context).textTheme.bodyMedium,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 361.w,
                  child: CustomLocationField(controller: homeBloc.pickLocationController,readOnly: true,image: AppAssets.icLocationA,hintText: homeBloc.pickLocationController.text.isNotEmpty ? homeBloc.pickLocationController.text : "pick location",icon: Icons.clear,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 361.w,
                  child: CustomTextField(controller: homeBloc.userCommentController,hintText: "Sender phone number",visible: true,)),
            ),

            addHeight(24.h),
            Text("Receiver:",style: Theme.of(context).textTheme.bodyMedium,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 361.w,
                  child: CustomLocationField(controller: homeBloc.dropLocationController,readOnly: true,image: AppAssets.icLocationB,hintText: homeBloc.dropLocationController.text.isNotEmpty ? homeBloc.dropLocationController.text : "Where to deliver",icon: Icons.clear,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 361.w,
                  child: CustomTextField(controller: homeBloc.userCommentController,hintText: "Receiver phone number",visible: true,)),
            ),

            addHeight(24.h),
            Text("Deliver by::",style: Theme.of(context).textTheme.bodyMedium,),
            Row(
              children: [
                addWidth(16.w),
                Container(
                  height: 40.67.h,
                  width: 49.33.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Theme.of(context).colorScheme.onPrimaryContainer
                  ),
                  child: SvgPicture.asset(AppAssets.courierBike,height: 30.h,width: 30.w,),
                ),
                addWidth(7.w),
                Text(AppLocalizations.of(context)!.bike,style: Theme.of(context).textTheme.bodyLarge,),
                const Spacer(),
                Switch(value: true, onChanged: (value){},),
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
                      color: Theme.of(context).colorScheme.onPrimaryContainer
                  ),
                  child: SvgPicture.asset(AppAssets.auto,height: 30.h,width: 30.w,),
                ),
                addWidth(7.w),
                Text(AppLocalizations.of(context)!.auto,style: Theme.of(context).textTheme.bodyLarge,),
                const Spacer(),
                Switch(value: true, onChanged: (value){},),
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
                    borderSide: BorderSide(width: 0.5.w, color: homeBloc.pickLocationController.text.isNotEmpty ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor),
                    borderRadius: BorderRadius.circular(12.r), // Add border radius
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  hintText: "Description", // Hint text
                  hintStyle: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            addHeight(6.h),
            Row(
              children: [
                addWidth(6.w),
                CommentModel(comments: "Books"),
                addWidth(6.w),
                CommentModel(comments: "Keys"),
                addWidth(6.w),
                CommentModel(comments: "Box"),
                addWidth(6.w),
                CommentModel(comments: "Tiffin box"),
                addWidth(6.w),
              ],
            ),
            addHeight(6.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 62.h,
                  width: 361.w,
                  child: CustomButton(
                    title: "Find a Driver",
                    icon: Icons.search,
                    borderColor: Theme.of(context).primaryColor,
                    onTap: () {
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
                  )),
            ),
            addHeight(6.h),
          ],
        ),
      ),
    );
  }
}
