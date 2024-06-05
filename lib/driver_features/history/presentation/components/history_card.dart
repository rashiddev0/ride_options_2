import '../../../../common/const/export.dart';

class HistoryCard extends StatelessWidget {
  final String date;
  final String status;
  final String amount;
  final String location;
  final Color statusColor;
  final String statusIcon;

  HistoryCard({
    required this.date,
    required this.status,
    required this.amount,
    required this.location,
    required this.statusColor,
    required this.statusIcon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Padding(
        padding:  EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    SvgPicture.asset(statusIcon),
                    addWidth(4.w),
                    Text(
                      status,
                      style: TextStyle(color: statusColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              amount,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset(AppAssets.a),
                SizedBox(width: 8.w),
                Expanded(child: Text(location,maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.b),
                SizedBox(width: 8.w),
                Expanded(child: Text(location,maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ]
            ),
          ],
        ),
      ),
    );
  }
}