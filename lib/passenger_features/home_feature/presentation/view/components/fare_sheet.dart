import 'package:ride_options_2/passenger_features/home_feature/presentation/bloc/homeBloc/home_bloc.dart';

import '../../../../../common/const/export.dart';
import 'custom_faild_fare.dart';

// ignore: must_be_immutable
class FareSheet extends StatelessWidget {
  FareSheet({
    super.key,
    this.recommendedFare,
  });

  int? recommendedFare;

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 400.h,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), // Adjust the radius as needed
            topRight: Radius.circular(16.r), // Adjust the radius as needed
          ),
        ),
        child: ListView(
          padding:
              EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w,),
          physics: const ClampingScrollPhysics(),
          //controller: scrollController,
          children: [
            addHeight(8.h),
            SizedBox(
                width: 361.w,
                child: Text(
                  AppLocalizations.of(context)!.offerYourFare,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                )),
            addHeight(24.h),
            CustomFareField(
              readOnly: false,
              controller: homeBloc.fareController,
              hintText: "$recommendedFare",
              icon: Icons.money_outlined,
              keyboardType: TextInputType.number,
            ),
            addHeight(16.h),
            Text(
              "${AppLocalizations.of(context)!.suggestions}:",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            addHeight(4.h),
            SizedBox(
              width: 200,
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10.h),
                itemCount: 4,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      homeBloc.fareController.text =
                          homeBloc.rideCategoryRate[index].toString();
                      Navigator.pop(context);
                      homeBloc.setFareInField();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.h),
                      height: 50.h,
                      width: 82.w,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Center(
                          child: Text("${homeBloc.rideCategoryRate[index]}")),
                    ),
                  );
                },
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    addWidth(14.w),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        AppLocalizations.of(context)!.autoAcceptDriverWithMyOffer,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 1,
                      child: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    addWidth(16.w),
                  ],
                ),
              ),
            ),
            const Spacer(),
            addHeight(16.h),
            ElevatedButton(
              onPressed: () {
                if (homeBloc.fareController.text.isNotEmpty) {
                  homeBloc.fareController.text = homeBloc.fareController.text;
                  Navigator.pop(context);
                }
              },
              child: Text(AppLocalizations.of(context)!.apply),
            ),
          ],
        ),
      ),
    );
  }
}
