import '../../../../common/const/export.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text( AppLocalizations.of(context)!.privacy_policy,),
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
              AppLocalizations.of(context)!.privacy_policy_content,
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