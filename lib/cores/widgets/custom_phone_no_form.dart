import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../helper/theme_helper.dart';

// ignore: must_be_immutable
class CustomPhoneField extends StatelessWidget {
  String ininitialCountryCode;
  TextEditingController? controller;
  Color? cursorColor;
  bool? readOnly;
  Color? textColor;
  double? textSize;
  EdgeInsets? contentPadding;
  InputBorder? inputBorder;
  Widget? prefixIcon;
  bool? filled;
  Color? filledColor;
  String? hintText;
  double? hintSize;
  double? dropDownTextSize;
  FontWeight? hintWeight;
  FontWeight? dropDownTextWeight;
  Color? hintColor;
  Color? dropDownTextColor;
  double? borderRadius;
  Color? borderColor;
  Color? errorBorderColor;
  double? borderWidth;
  IconData? dropdownIcon;
  Color? dropdownIconColor;
  Widget? sufficIcon;
  CustomPhoneField(
      {super.key,
      this.ininitialCountryCode = 'SA',
      this.controller,
      this.cursorColor = ThemeColors.primaryBlue,
      this.textColor = ThemeColors.grey1,
      this.textSize = 12,
      this.contentPadding = const EdgeInsets.fromLTRB(13, 15, 13, 15),
      this.prefixIcon = const Icon(Icons.phone),
      this.hintText = 'Enter your number',
      this.hintSize = 12,
      this.dropDownTextSize = 12,
      this.hintWeight = FontWeight.w400,
      this.dropDownTextWeight = FontWeight.w400,
      this.hintColor = ThemeColors.grey1,
      this.dropDownTextColor = ThemeColors.grey2,
      this.borderColor = Colors.white, //ThemeColors.grey1,
      this.errorBorderColor = Colors.white, //ThemeColors.red,
      this.borderWidth = 1.0,
      this.borderRadius = 20,
      this.inputBorder = InputBorder.none,
      this.filled = true,
      this.filledColor = Colors.white,
      this.dropdownIcon = Icons.arrow_drop_down,
      this.dropdownIconColor = ThemeColors.grey2,
      this.sufficIcon,
      this.readOnly});

  Widget? prefix;

  // dropdownIconColor=ThemeColors.grey2.withOpacity(0.7);
  Color calculateDropdownIconColor(Color baseColor) {
    return baseColor.withOpacity(0.7);
  }

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    prefix = const Icon(Icons.phone);

    return IntlPhoneField(
      // validator: _validatePhone,
      onChanged: (phone) async {},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialCountryCode: ininitialCountryCode,
      showCountryFlag: true,

      readOnly: readOnly ?? false,
      keyboardType: TextInputType.phone,
      controller: controller,
      cursorColor: cursorColor,
      style: TextStyle(color: textColor, fontSize: textSize),

      dropdownTextStyle: TextStyle(
          color: dropDownTextColor,
          fontSize: dropDownTextSize,
          fontWeight: dropDownTextWeight),

      dropdownDecoration: const BoxDecoration(
          // prefixStyle: TextStyle(color: /* Your desired color */),
          ),
      dropdownIcon: Icon(
        dropdownIcon,
        color: ThemeColors.primaryBlue, // ThemeColors.grey2.withOpacity(0.7),
      ),
      decoration: InputDecoration(
        filled: filled,
        fillColor: filledColor,
        contentPadding: contentPadding,

        prefixIcon: prefixIcon,
        suffixIcon: sufficIcon,
        // prefix: prefix!,

        hintText: hintText, //AppLocale.phoneNumber.getString(context),
        hintStyle: TextStyle(
            color: hintColor, fontSize: hintSize, fontWeight: hintWeight),
        counterText: '',
        counterStyle: const TextStyle(
          color: Colors.red, // Change the color of the validating text
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: borderWidth!, color: Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.transparent, width: borderWidth!),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth!, color: errorBorderColor!),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth!, color: errorBorderColor!),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}
