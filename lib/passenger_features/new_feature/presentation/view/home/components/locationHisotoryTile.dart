

import '../../../../../../common/const/export.dart';

class LocationHistoryTile extends StatelessWidget {
  LocationHistoryTile({super.key,this.address});

  String? address;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 4.h,bottom: 4.h,right: 16.w,left: 16.w),
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary.withOpacity(.10)),
        //width: 156.w,
      height: 30.h,
        child: Text(
          address!,
          style: Theme.of(context).textTheme.labelMedium!,
          maxLines: 1,
        ),);
  }
}
