import '../../../../../../common/const/export.dart';
import '../../../../../../common/custom_widgets/custom_button.dart';

class EmargencyAssistanceSheet  extends StatelessWidget {
  const EmargencyAssistanceSheet ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), // Adjust the radius as needed
          topRight: Radius.circular(16.r), // Adjust the radius as needed
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          addHeight(8.h),
          Padding(
            padding: EdgeInsets.only(left: 170.w, right: 170.w),
            child: SizedBox(
              width: 50,
              child: Divider(
                thickness: 5,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          addHeight(8.h),
          SizedBox(
              width: 361.w,
              child: Text(
                "Emergency assist",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              )),
          addHeight(8.h),
          SizedBox(
              width: 361.w,
              child: Text(
                "You can use options given below for emergency assistance.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )),
          addHeight(8.h),
          const Spacer(),
          CustomButton(
            icon: Icons.call,
            title: "Ambulance",
            onTap: () {},
            borderColor: Theme.of(context).primaryColor,
          ),
          addHeight(8.h),
          CustomButton(
            icon: Icons.call,
            title: "Police",
            onTap: () {},
            borderColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

