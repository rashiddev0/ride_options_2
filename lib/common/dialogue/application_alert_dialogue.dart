import '../const/export.dart';
import '../custom_widgets/custom_button.dart';

// ignore: must_be_immutable
class ApplicationAlertDialogue extends StatelessWidget {
  String? imagePath;
  double? imageWidth;
  double? imageHeight;
  String? title;
  String? description;
  TextStyle? titleStyle;
  TextStyle? descriptionStyle;
  TextStyle? descriptionHighlightStyle;
  double? dialogueHeight;
  Function() onTap;
  bool richTextFlag;
  String? txt1;
  String? txt2;
  String? txt3;
  bool? cancelBtnVisible;
  String? buttonText;
  bool? crossBtnVisible;
  bool? pngPath;
  bool? enableBack;

  ApplicationAlertDialogue(
      {this.imagePath,
      this.title,
      this.description,
      this.titleStyle,
      this.descriptionStyle,
      this.descriptionHighlightStyle,
      this.dialogueHeight,
      required this.onTap,
      this.imageHeight = 230,
      this.imageWidth = 280,
      required this.richTextFlag,
      this.txt1,
      this.txt2,
      this.txt3,
      this.cancelBtnVisible = false,
      this.buttonText = "Continue",
      this.crossBtnVisible = true,
      this.enableBack,
      this.pngPath = false});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SizedBox(
          height: 280.h,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              SvgPicture.asset(
                imagePath!,
                width: imageWidth,
                height: imageHeight,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                title!,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                description!,
                textAlign: TextAlign.center,
              ),
              addHeight(30.h),
              CustomButton(title: "tryAgain", onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
