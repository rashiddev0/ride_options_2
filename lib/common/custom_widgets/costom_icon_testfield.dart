import '../const/export.dart';

class CustomtIconTextField extends StatelessWidget {
  CustomtIconTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.onChange,
        this.focusNode,
        this.prefixIcon,
        this.onTap,
        this.keyboardType = TextInputType.text});

  TextEditingController controller = TextEditingController();
  String hintText;
  void Function(String)? onChange;
  FocusNode? focusNode;
  Widget? prefixIcon;
  TextInputType keyboardType;
  void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337.w,
      height: 60.h,
      child: TextFormField(
        // cursorHeight: 20.h,
        // textAlign: TextAlign.center,
        focusNode: focusNode,
        onChanged: onChange,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        onTap: onTap,

        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: keyboardType, // Set keyboard type to number

        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              // Add border
              borderSide: BorderSide(width: 0.5.w, color: controller.text.isNotEmpty ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(12.r), // Add border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12.r),
            ),
            hintText: hintText, // Hint text
            hintStyle: Theme.of(context).textTheme.bodyMedium
        ),
      ),
    );
  }
}
