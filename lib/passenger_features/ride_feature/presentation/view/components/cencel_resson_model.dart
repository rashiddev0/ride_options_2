import '../../../../../../common/const/export.dart';

class CancelReasonsModel extends StatelessWidget {
  String  reasons;
  CancelReasonsModel({super.key,required this.reasons});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Radio(value: false, groupValue: (){}, onChanged: (value){}),
        addWidth(8.w),
        Text(
          reasons,
          style: Theme.of(context).textTheme.bodyMedium!,
          maxLines: 1,
        ),
      ],
    );
  }
}
