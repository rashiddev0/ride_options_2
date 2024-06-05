import '../../../../common/const/export.dart';
import '../../components/favourites_card.dart';

class FavouritesScreen extends StatelessWidget {


  FavouritesScreen({super.key});

  final List<Map<String, String>> favourites = [
    {
      'title': 'Office',
      'subtitle': 'Jay Bee\'s, Link road, Model town',
    },
    {
      'title': 'Home',
      'subtitle': 'Clifton colony, Wahadat colony, Muslim town',
    },
    {
      'title': 'Waffles',
      'subtitle': 'Main Market, Main Bulvard road',
    },
    {
      'title': 'Coffee',
      'subtitle': '2nd cup, Faisal town',
    },
    {
      'title': 'City terminal',
      'subtitle': 'City terminal, Band road, Lahore',
    },
    {
      'title': 'Flat',
      'subtitle': 'Good luck bakers, Faiz road, Muslim town',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( AppLocalizations.of(context)!.favourites,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.sp),
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          return CustomCard(
            title: favourites[index]['title']!,
            subtitle: favourites[index]['subtitle']!,
          );
        },
      ),
      bottomNavigationBar:Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            AppLocalizations.of(context)!.add_new,
          ),
        ),
      ),
    );
  }
}