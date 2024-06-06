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

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.history,
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16.r),
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            final item = historyItems[index];
            return HistoryCard(
              statusIcon: item['status'] == "Completed"
                  ? AppAssets.check
                  : AppAssets.cancle_fav,
              date: item['date'],
              status: item['status'],
              amount: item['amount'],
              location: item['location'],
              statusColor: item['statusColor'],
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2.w),
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
                Icon(Icons.refresh,
                    color: Theme.of(context).colorScheme.primary),
                addWidth(12.w),
                Text(
                  'Load more',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
