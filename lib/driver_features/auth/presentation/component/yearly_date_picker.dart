import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearPickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onYearSelected;

  YearPickerDialog({required this.initialDate, required this.onYearSelected});

  @override
  _YearPickerDialogState createState() => _YearPickerDialogState();
}

class _YearPickerDialogState extends State<YearPickerDialog> {
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialDate.year;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Year'),
      content: Container(
        height: 300.h,
        width: 400.w,
        child: YearPicker(
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
          selectedDate: DateTime(_selectedYear),
          onChanged: (DateTime picked) {
            setState(() {
              _selectedYear = picked.year;
            });
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            widget.onYearSelected(DateTime(_selectedYear));
            Navigator.of(context).pop();
          },
          child: Text('Select'),
        ),
      ],
    );
  }
}
