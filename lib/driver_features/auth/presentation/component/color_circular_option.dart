import 'package:flutter/cupertino.dart';

import '../../../../common/const/export.dart';

class ColorCircularOption extends StatelessWidget {
  final Color color;
  final String colorName;
  void Function()? onTap;

  ColorCircularOption(this.color, this.colorName,this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
          Container(
            width:50.h,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: color,
              border: Border.all(color:Theme.of(context).colorScheme.inverseSurface,width: 2 )
            ),
          ),
          SizedBox(height: 5),
          Text(colorName,style: Theme.of(context).textTheme.labelLarge,),
        ],
      ),
    );
  }
}