import '../../../../../../common/const/export.dart';

class BannerBox extends StatelessWidget {
  BannerBox(
      {super.key,
        this.onTap,
        this.bannerImage,
      });

  void Function()? onTap;
  final String? bannerImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 157.h,
        width: 361.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border:
          Border.all(width: .50.w, color: greyColor.withOpacity(.3)),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        //padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 10.w),
        child: Image.asset(bannerImage ?? "",
          height: 170.h, width: 170.w,fit: BoxFit.fill,alignment: Alignment.center,),
      ),
    );
  }
}
