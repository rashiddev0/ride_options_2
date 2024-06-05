import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import '../../../../../common/const/export.dart';
import '../bloc/homeBloc/home_bloc.dart';
import '../bloc/homeBloc/home_event.dart';
import '../bloc/homeBloc/home_state.dart';
import 'components/banner_box.dart';
import 'components/categoryBox.dart';
import 'components/home_appbar.dart';
import 'components/offer_box.dart';
import 'components/place_serch_bottom_sheet.dart';
import 'components/whereToContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          HomeAppBar(),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(16.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: WhereToContainer(
                      locationHistory: homeBloc.locationHistory.isNotEmpty
                          ? homeBloc.locationHistory
                          : [],
                      //onTap: ()=> const PlaceSearchSheet(),
                      onTap: () async {
                        if (homeBloc.pickLocationMap.isEmpty) {
                          homeBloc.add(GetLocation());
                        }
                        else {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              enableDrag: true,
                              useSafeArea: true,
                              builder: (BuildContext context) {
                                return const PlaceSearchSheet();
                              });
                        }
                      },
                    ),
                  ),
                  addHeight(16.h),
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Text(
                      AppLocalizations.of(context)!.ourServices,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  addWidth(4.w),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CategoryBox(
                          categoryName: AppLocalizations.of(context)!.cityRides,
                          categoryImage: AppAssets.bike,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.locationMapScreen);
                          },
                        ),
                        CategoryBox(
                          categoryName: AppLocalizations.of(context)!.courier,
                          categoryImage: AppAssets.courier,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.courierScreen);
                          },
                        ),
                        CategoryBox(
                          categoryName: AppLocalizations.of(context)!.cityToCity,
                          categoryImage: AppAssets.cityToCity,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  addHeight(16.h),
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Text(
                      AppLocalizations.of(context)!.topOffers,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  addWidth(4.w),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: ScrollLoopAutoScroll(
                        scrollDirection: Axis.horizontal,
                        //required
                        delay: const Duration(milliseconds: 10),
                        duration: const Duration(seconds: 200),
                        //gap: 25,
                        reverseScroll: false,
                        //duplicateChild : 25,
                        enableScrollInput: true,
                        delayAfterScrollInput: const Duration(milliseconds: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OfferBox(
                              offerImage: "assets/imgs/temp/a.png",
                              onTap: () {},
                            ),
                            OfferBox(
                              offerImage: "assets/imgs/temp/b.png",
                              onTap: () {},
                            ),
                            OfferBox(
                              offerImage: "assets/imgs/temp/c.jpg",
                              onTap: () {},
                            ),
                            OfferBox(
                              offerImage: "assets/imgs/temp/d.jpg",
                              onTap: () {},
                            ),
                            OfferBox(
                              offerImage: "assets/imgs/temp/e.jpg",
                              onTap: () {},
                            ),
                            OfferBox(
                              offerImage: "assets/imgs/temp/f.jpg",
                              onTap: () {},
                            ),
                          ],
                        )),
                  ),
                  addHeight(16.h),
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Text(
                      AppLocalizations.of(context)!.comingSoon,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  addWidth(4.w),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                          padding: EdgeInsets.all(10.h),
                          itemBuilder: (context, index) {
                            return BannerBox(
                              bannerImage: homeBloc.bannerList[index],
                              onTap: () {},
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                          itemCount: homeBloc.bannerList.length),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
