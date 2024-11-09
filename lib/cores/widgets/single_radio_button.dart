import 'package:flutter/material.dart';
import '../helper/mySize.dart';
import '../helper/theme_helper.dart';

class CustomSingleRadioButton extends StatelessWidget {
  final bool isSelected;
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;
  const CustomSingleRadioButton(
      {super.key, this.isSelected = false, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MySize.size18,
          width: MySize.size18,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: ThemeColors.primaryBlue),
            // color: Colors.red,
          ),
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color:
                    isSelected ? ThemeColors.primaryBlue : Colors.transparent),
          ),
        ),
      ),
    );
  }
}
