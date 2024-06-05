import '../../../../common/const/export.dart';
import '../components/history_card.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> historyItems = [
    {
      'date': '3 SEP 2023, 8:06 PM',
      'status': 'Cancelled',
      'amount': 'Rs. 145',
      'location': 'Jay Bee\'s, Link road, Model town, Lahore, 12',
      'statusColor': Colors.red,
    },
    {
      'date': '3 SEP 2023, 8:06 PM',
      'status': 'Completed',
      'amount': 'Rs. 145',
      'location': 'Jay Bee\'s, Link road, Model town, Lahore, 12',
      'statusColor': Colors.green,
    },
    {
      'date': '3 SEP 2023, 8:06 PM',
      'status': 'Completed',
      'amount': 'Rs. 145',
      'location': 'Jay Bee\'s, Link road, Model town, Lahore, 12',
      'statusColor': Colors.green,
    },
    {
      'date': '3 SEP 2023, 8:06 PM',
      'status': 'Completed',
      'amount': 'Rs. 145',
      'location': 'Jay Bee\'s, Link road, Model town, Lahore, 12',
      'statusColor': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.history,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: historyItems.length,
        itemBuilder: (context, index) {
          final item = historyItems[index];
          return HistoryCard(
            statusIcon:item['status']=="Completed"?AppAssets.check:AppAssets.cancle_fav ,
            date: item['date'],
            status: item['status'],
            amount: item['amount'],
            location: item['location'],
            statusColor: item['statusColor'],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 60.w,vertical: 10.h),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Colors.purple),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          onPressed: () {
            // Handle button press
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.refresh, color: AppColors.primary),
              Text(
                'Load more',
                style: TextStyle(color: AppColors.primary),
              ),

            ],
          ),
        ),
      ),
    );
  }
}