import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../helper/mySize.dart';
import '../helper/theme_helper.dart'; // Assuming you are using velocity_x for text styling

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedValue;
  final Function(String?) onChanged;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry menuPadding;
  final double menuItemHeight;
  final double borderRadius;
  final Offset offset;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.iconSize = 15,
    this.padding = const EdgeInsets.symmetric(horizontal: 19),
    this.menuPadding = const EdgeInsets.symmetric(horizontal: 14),
    this.menuItemHeight = 40,
    this.borderRadius = 10,
    this.offset = const Offset(-20, 10),
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      items: items
          .map<DropdownMenuItem<String>>(
              (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Column(
                      children: [
                        item.text
                            .size(MySize.size14)
                            .color(ThemeColors.whiteColor)
                            .make(),
                      ],
                    ),
                  ))
          .toList(),
      onChanged: onChanged,
      underline: Container(),
      iconStyleData: IconStyleData(
          iconSize: iconSize,
          icon: const RotatedBox(
              quarterTurns: 3, child: Icon(Icons.arrow_back_ios))),
      buttonStyleData: ButtonStyleData(
        padding: padding,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: ThemeColors.primaryColor),
        offset: offset,
      ),
      menuItemStyleData: MenuItemStyleData(
        height: menuItemHeight,
        padding: menuPadding,
      ),
    );
  }
}
