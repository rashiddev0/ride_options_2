import '../../../common/const/export.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),

      ),
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.locationPin,color: AppColors.primary,),
            ],
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          trailing:   SvgPicture.asset(AppAssets.edit,color: AppColors.primary,),
          onTap: () {
            // Handle card tap
          },
        ),
      ),
    );
  }
}