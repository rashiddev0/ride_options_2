import '../../../../../common/const/export.dart';

class CustomFareField extends StatelessWidget {
  CustomFareField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onChange,
      this.focusNode,
      this.onTap,
      this.iconTap,
      this.icon,
      required this.readOnly,
      this.colorIcon,
      this.keyboardType = TextInputType.text});

  TextEditingController controller = TextEditingController();
  String hintText;
  void Function(String)? onChange;
  FocusNode? focusNode;
  IconData? icon;
  Color? colorIcon;
  bool readOnly;
  TextInputType keyboardType;
  void Function()? onTap;
  void Function()? iconTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393.w,
      height: 60.h,
      child: TextFormField(
        focusNode: focusNode,
        onChanged: onChange,
        readOnly: readOnly,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        textAlign: TextAlign.center,
        onTap: onTap,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: keyboardType,
        // Set keyboard type to number
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
            suffixIcon: InkWell(
              onTap: iconTap,
              child: Icon(
                icon,
                color: colorIcon,
                size: 26,
              ),
            ),
            contentPadding: EdgeInsets.only(
                left: 1.w, right: 15.w, top: 10.h, bottom: 10.h),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                "PKR.",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            border: OutlineInputBorder(
              // Add border
              borderSide: BorderSide(width: 0.002.w, color: Colors.white),
              borderRadius: BorderRadius.circular(12.r), // Add border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .002.w, color: Colors.white),
              borderRadius: BorderRadius.circular(12.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .002.w, color: Colors.white),
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .002.w, color: Colors.white),
              borderRadius: BorderRadius.circular(12.r),
            ),
            hintText: hintText,
            // Hint text
            hintStyle: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}