import 'package:ride_options_2/common/const/export.dart';

class AppText extends StatefulWidget {
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
      this.maxLines});
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

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment!,
            child: Text(
              widget.text ?? "",
              textAlign: widget.textAlign,
              overflow: widget.textOverflow ?? TextOverflow.clip,
              maxLines: widget.maxLines ?? 6,
              style: TextStyle(
                  fontFamily: AppLocalizations.of(context)!.appFontFamily,
                  color: widget.color,
                  height: widget.height ?? 1.5,
                  fontSize: widget.fontSize ?? 16,
                  fontStyle: widget.fontStyle ?? FontStyle.normal,
                  fontWeight: widget.fontWeight ?? FontWeight.w500),
            ),
          )
        : Text(
            widget.text ?? "",
            textAlign: widget.textAlign,
            overflow: widget.textOverflow ?? TextOverflow.ellipsis,
            maxLines: widget.maxLines ?? 6,
            style: TextStyle(
                fontFamily: AppLocalizations.of(context)!.appFontFamily,
                color: widget.color,
                height: widget.height ?? 1.5,
                fontSize: widget.fontSize ?? 16,
                fontStyle: widget.fontStyle ?? FontStyle.normal,
                fontWeight: widget.fontWeight ?? FontWeight.w500),
          );
  }
}
