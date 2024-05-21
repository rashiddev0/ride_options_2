import '../../../../../../common/const/export.dart';

class OfferBox extends StatelessWidget {
  OfferBox(
      {super.key,
        this.onTap,
        this.offerImage,
      });

  void Function()? onTap;
  final String? offerImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 170.h,
        width: 170.w,
        decoration: BoxDecoration(
          color: whiteColor,
          border:
          Border.all(width: .50.w, color: greyColor.withOpacity(.3)),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        //padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 10.w),
        child: Image.asset(offerImage ?? "",
            height: 170.h, width: 170.w,fit: BoxFit.fill,alignment: Alignment.center,),
      ),
    );
  }
}
