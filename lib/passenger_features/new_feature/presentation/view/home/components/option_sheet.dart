
import 'package:ride_options_2/common/custom_widgets/costom_icon_testfield.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';
import 'package:ride_options_2/common/custom_widgets/custom_textfield.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/comment_model.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/view/home/components/saved_address_model.dart';

import '../../../../../../common/const/export.dart';
import '../../../bloc/homeBloc/home_bloc.dart';
import '../../../bloc/homeBloc/home_state.dart';

class OptionSheet extends StatelessWidget {
  ScrollController scrollController;
  OptionSheet({super.key,required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
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
          SizedBox(
            width: 361.w,
              child: Text("Options",style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)),
          addHeight(24.h),
          Row(
            children: [
              addWidth(16.w),
              Text("More than 1 person",style: Theme.of(context).textTheme.bodyLarge,),
              const Spacer(),
              Switch(value: true, onChanged: (value){},),
              addWidth(16.w),
            ],
          ),
          addHeight(16.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w,right: 16.w),
            child: CustomtIconTextField(controller: homeBloc.userCommentController, hintText: "Comments",prefixIcon: const Icon(Icons.comment),),
          ),
          Wrap(
              spacing: 10, // Space between widgets in the same run
              runSpacing: 20,
              children: [
            CommentModel(
              comments: homeBloc.commentList[0],
            ),
            addHeight(12.h),
            addWidth(12.w),
            CommentModel(
              comments: homeBloc.commentList[1],
            ),
                addHeight(12.h),
            addWidth(6.w),
            CommentModel(
              comments: homeBloc.commentList[2],
            ),
                addHeight(12.h),
            addWidth(6.w),
            CommentModel(
              comments: homeBloc.commentList[3],
            ),
                addHeight(12.h),
            addWidth(6.w),
            CommentModel(
              comments: homeBloc.commentList[4],
            ),
          ]),
          const Spacer(),
          addHeight(29.5),
          Padding(
            padding: EdgeInsets.only(left: 16.w,right: 16.w),
            child: CustomButton(title: "Apply", onTap: (){},borderColor: Theme.of(context).primaryColor,),
          )
        ],
      ),
    );
  },
);
  }
}
