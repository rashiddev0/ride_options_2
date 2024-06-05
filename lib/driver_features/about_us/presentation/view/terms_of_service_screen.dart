import '../../../../common/const/export.dart';

class TermsOfServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( AppLocalizations.of(context)!.terms_of_service,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.terms_of_service_content,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              "rideoptions@gmail.com\n042-123456789",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}