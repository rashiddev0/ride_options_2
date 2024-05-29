import '../const/export.dart';

class CustomLocationField extends StatelessWidget {
  CustomLocationField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.image,
        this.onChange,
        this.focusNode,
        this.onTap,
        this.iconTap,
        this.icon,
        required this.readOnly,
        this.colorIcon,
        this.keyboardType = TextInputType.text});

  TextEditingController controller = TextEditingController();
  String hintText,image;
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
      width: 315.w,
      height: 60.h,
      child: TextFormField(
        focusNode: focusNode,
        onChanged: onChange,
        readOnly: readOnly,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        onTap: onTap,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: keyboardType, // Set keyboard type to number
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
            suffixIcon: Container(
              width: 42.w,
              height: 50.h,
                color: Theme.of(context).colorScheme.primary.withOpacity(.10),
              child: InkWell(
                onTap: iconTap,
                child: Icon(
                  icon,
                  color: colorIcon,
                  size: 26,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
                left: 1.w, right: 15.w, top: 10.h, bottom: 10.h),
            prefixIcon: SizedBox(
              width: 1.5.w,
              height: 22.h,
              child: Row(
                children: [
                  addWidth(12.w),
                  SvgPicture.asset(
                    image,
                    width: 22.w,
                    height: 22.h,
                  ),
                ],
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
            hintText: hintText, // Hint text
            hintStyle: Theme.of(context).textTheme.bodyMedium
        ),
      ),
    );
  }
}
