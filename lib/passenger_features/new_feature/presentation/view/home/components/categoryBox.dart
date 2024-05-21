// ignore: must_be_immutable
import '../../../../../../common/const/export.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox(
      {super.key,
        //this.price,
        //this.text,
        this.onTap,
        //this.onInfo,
        //required this.selected,
        this.categoryImage,
        this.categoryName});

  void Function()? onTap;
  //void Function()? onInfo;
  //final String? text;
  //bool selected = false;
  final String? categoryName;
  final String? categoryImage;
  //final int? price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 116.h,
        width: 116.w,
        decoration: BoxDecoration(
          color: whiteColor,
          border:
          Border.all(width: .50.w, color: greyColor.withOpacity(.3)),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              categoryName!,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            addHeight(6.h),
            SvgPicture.asset(categoryImage ?? "",
                height: 58.h, width: 85.07.w),
          ],
        ),
      ),
    );
  }
}

