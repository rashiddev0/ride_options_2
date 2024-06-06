import '../../../../common/const/export.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            AppLocalizations.of(context)!.contact_us,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.sp),
          child: Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.address,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppLocalizations.of(context)!.contact_information,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "rideoptions@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.primary),
                ),
                Text(
                  "042-123456789",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.primary),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
