import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../common/const/export.dart';

class DropDownSelection extends StatelessWidget {
   DropDownSelection({Key? key,required this.options,required this.onOptionSelected,required this.searchLabel,
     required this.hint

   }) : super(key: key);
  List<ValueItem<Object?>> options;
   void Function(List<ValueItem<Object?>>) onOptionSelected;
   String searchLabel;
   String hint;
   @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
      constraints: BoxConstraints(
        minHeight:70.h,
        maxWidth: 361.w,
      ),

      child: MultiSelectDropDown(
        selectedOptionBackgroundColor:  Theme.of(context).colorScheme.primary.withOpacity(.3),
        optionsBackgroundColor:  Theme.of(context).colorScheme.onPrimaryContainer,
        fieldBackgroundColor:  Theme.of(context).colorScheme.onPrimaryContainer,
        searchBackgroundColor:  Theme.of(context).colorScheme.onPrimaryContainer,
        dropdownBackgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onOptionSelected: onOptionSelected,

        dropdownBorderRadius: 16.r,

        padding: EdgeInsets.only(right: 14.w,left: 8.w),
        dropdownMargin: 6.h,
        searchEnabled: true,
        searchLabel: searchLabel,


        suffixIcon: Icon(
          Icons.keyboard_arrow_down_sharp,
          size: 26.sp,
          weight: 10,
        ),
        options: options,
        maxItems: 5,
        disabledOptions: const [],
        hint: hint,

        selectionType: SelectionType.single,
        chipConfig: const ChipConfig(
            wrapType: WrapType.wrap),
        dropdownHeight: 390.h,
        borderColor: Colors.transparent,
        focusedBorderColor:Colors.transparent,
        singleSelectItemStyle:Theme.of(context).textTheme.titleLarge,
        optionTextStyle: Theme.of(context).textTheme.titleLarge,
        hintStyle: Theme.of(context).textTheme.titleMedium,


      ),
    );
  }
}
