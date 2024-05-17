import 'package:ride_options_2/common/const/export.dart';

class AppText extends StatelessWidget {

  final String? text;
  final double? fontSize;
  final Color? color;

  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final double? height;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const AppText(this.text,
      {super.key,
        this.fontSize,
        this.color,
        this.fontWeight,
        this.alignment,
        this.textAlign,
        this.height,
        this.fontStyle,
        this.textOverflow,
        this.maxLines,
        required TextStyle style});

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment!,
      child: Text(
        text ?? "",
        textAlign: textAlign,
        overflow: textOverflow ?? TextOverflow.clip,
        maxLines: maxLines ?? 6,
        style: TextStyle(
            fontFamily: AppLocalizations.of(context)!.appFontFamily,
            color: color,
            height: height ?? 1.5,
            fontSize: fontSize ?? 16,
            fontStyle: fontStyle ?? FontStyle.normal,
            fontWeight: fontWeight ?? FontWeight.w500),
      ),
    )
        : Text(
      text ?? "",
      textAlign: textAlign,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 6,
      style: TextStyle(
          fontFamily: AppLocalizations.of(context)!.appFontFamily,
          color: color,
          height: height ?? 1.5,
          fontSize: fontSize ?? 16,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontWeight: fontWeight ?? FontWeight.w500),
    );
  }
  }

