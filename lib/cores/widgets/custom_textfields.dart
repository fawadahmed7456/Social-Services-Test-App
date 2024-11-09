import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/mySize.dart';
import '../helper/theme_helper.dart';

class CustomTextField14 extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final int? minLines;
  final double? radius;
  final FocusNode? focusNode;
  final Color textColor;
  final Color hintTextColor;
  final bool? showCursor;
  final bool readOnly;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final Color fillColor;
  final List<TextInputFormatter> inputFormatter;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final OutlineInputBorder borderSide;
  static const Color fillColorDefaultValue = Color(0xffF0F0F0);
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const CustomTextField14({
    super.key,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.autoValidateMode,
    this.title,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.showCursor,
    this.readOnly = false,
    this.hintText,
    this.fillColor = fillColorDefaultValue,
    this.prefixIcon,
    this.sufixIcon,
    this.textColor = Colors.black54,
    this.hintTextColor = ThemeColors.grey,
    this.onChanged,
    this.focusNode,
    this.inputFormatter = const <TextInputFormatter>[],
    this.radius = 10.0,
    this.borderColor,
    this.focusedBorderColor,
    this.borderSide = const OutlineInputBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title == null)
            ? Container()
            : Container(
                margin: const EdgeInsets.only(bottom: 3, left: 2, right: 2),
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.whiteColor,
                    fontFamily: GoogleFonts.nunitoSans()
                        .fontFamily, // Add fontFamily property
                  ),
                ),
              ),
        const SizedBox(height: 5),
        TextFormField(
          focusNode: focusNode,
          onChanged: onChanged,
          showCursor: showCursor,
          textInputAction: TextInputAction.done,
          readOnly: readOnly,
          minLines: minLines,
          maxLines: maxLines,
          onTap: onTap,
          autovalidateMode: autoValidateMode,
          obscureText: obscureText,
          validator: validator,
          inputFormatters: inputFormatter,
          cursorColor: ThemeColors.primaryBlue,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            errorStyle: TextStyle(
                color: const Color.fromARGB(255, 236, 49, 49).withOpacity(1)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red, // Change error border color here
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(radius!)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red, // Change error border color here
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(radius!)),
            border: OutlineInputBorder(
              borderSide: borderSide.borderSide,
              borderRadius: BorderRadius.all(
                Radius.circular(radius!),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ??
                    ThemeColors.primaryColor.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(radius!),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? ThemeColors.testGrey.withOpacity(0.6),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(radius!),
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: hintTextColor,
                fontSize: MySize.size11,
                fontWeight: FontWeight.w400),
            isDense: true,
            fillColor: fillColor,
            filled: true,
            suffixIcon: sufixIcon,
            contentPadding: EdgeInsets.fromLTRB(
                MySize.size15, MySize.size6, MySize.size15, MySize.size6),
          ),
          controller: controller,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
