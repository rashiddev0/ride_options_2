import '../../../../common/const/export.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text(  AppLocalizations.of(context)!.contact_us,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primary),
            ),
            Text(
              "042-123456789",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primary),

            )

          ],
        ),
      ),
    );
  }
}