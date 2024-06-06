import '../../../../../common/const/export.dart';

class FareField extends StatelessWidget {
  FareField(
      {super.key,

        });


  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          alignment: Alignment.center,
          width: 295.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                  width: 1.w,
                  color: Theme.of(context).colorScheme.inverseSurface)),
          child: Row(
            children: [
              addWidth(16.w),
              Text("${AppLocalizations.of(context)!.fare}:",style: Theme.of(context).textTheme.labelMedium,),
              const Spacer(),
              Text("PKR.${AppLocalizations.of(context)!.offerAPrice}",style: Theme.of(context).textTheme.labelMedium,),
              addWidth(16.w),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.accountType, (route) => false);
        });
  }
}
