import 'package:ride_options_2/common/custom_widgets/costom_icon_testfield.dart';

import '../../../../../../common/const/export.dart';
import '../../../../home_feature/presentation/bloc/homeBloc/home_bloc.dart';
import '../../../../home_feature/presentation/bloc/homeBloc/home_state.dart';
import '../../../../home_feature/presentation/view/components/comment_model.dart';

class OptionSheet extends StatelessWidget {
  ScrollController scrollController;

  OptionSheet({super.key, required this.scrollController});

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
            padding: EdgeInsets.only(
                top: 8.h, left: 16.w, right: 16.w, bottom: 16.h),
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            children: [
              addHeight(8.h),
              SizedBox(
                  width: 361.w,
                  child: Text(
                    AppLocalizations.of(context)!.options,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  )),
              addHeight(24.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    addWidth(16.w),
                    Text(
                      AppLocalizations.of(context)!.moreThan1Person,
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
              ),
              addHeight(16.h),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomtIconTextField(
                    controller: homeBloc.userCommentController,
                    hintText: AppLocalizations.of(context)!.comments,
                    prefixIcon: const Icon(Icons.comment),
                  )),
              addHeight(8.h),
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
              ElevatedButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.apply),)
              /*CustomButton(
                title: "Apply",
                onTap: () {},
                borderColor: Theme.of(context).primaryColor,
              )*/
            ],
          ),
        );
      },
    );
  }
}
