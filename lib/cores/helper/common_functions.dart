import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:social_services/cores/helper/mySize.dart';
import 'package:social_services/cores/helper/theme_helper.dart';

class CommonFunctions {
  static String? validateTextField(value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "field Required";
    } else {
      return null;
    }
  }

  static String? validateNewName(value, BuildContext context, String oldName) {
    if (value == null || value.isEmpty) {
      return "field Required";
    } else if (value == oldName) {
      return "New name must be different from old name";
    } else {
      return null;
    }
  }

  static String? validateConfirmPasswordTextField(
      value, BuildContext context, String newPassword, String confirmPassword) {
    if (value == null || value.isEmpty || newPassword != confirmPassword) {
      return "Password does no match";
    } else {
      return null;
    }
  }

  static String? validateNewPasswordTextField(
      value, BuildContext context, String newPassword, String oldPassword) {
    if (value == null || value.isEmpty) {
      return "Field Required";
    } else if (newPassword == oldPassword) {
      return "New password must not match old password";
    } else {
      return null;
    }
  }

  static String? validateTextFieldWithMessageTitle(
      value, String msg, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "$msg is Required";
    } else {
      return null;
    }
  }

  static void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static flushBarErrorMessage(String msg, BuildContext context) {
    MySize().init(context);
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        message: msg,
        barBlur: 2,
        messageColor: ThemeColors.bgColor,
        messageSize: MySize.size14,
        backgroundColor: ThemeColors.red.withOpacity(0.5),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(seconds: 3),
        borderColor: ThemeColors.navBarGrey,
        borderWidth: 0.1,
        positionOffset: 20,
        icon: Icon(
          Icons.error,
          size: MySize.size26,
          color: ThemeColors.bgColor,
        ),
        borderRadius: BorderRadius.circular(5),
      )..show(context),
    );
  }

  static flushBarSuccessMessage(
    String msg,
    BuildContext context,
  ) {
    MySize().init(context);
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        message: msg,
        barBlur: 2,
        messageColor: ThemeColors.bgColor,
        messageSize: MySize.size14,
        backgroundColor: Colors.green.withOpacity(0.5),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(seconds: 3),
        borderColor: ThemeColors.navBarGrey,
        borderWidth: 0.1,
        positionOffset: 20,
        icon: Icon(
          Icons.check_circle_rounded,
          size: MySize.size26,
          color: ThemeColors.bgColor,
        ),
        borderRadius: BorderRadius.circular(5),
      )..show(context),
    );
  }

  static flushBarSuccessForNegativeMessage(
      String msg, BuildContext context, Color color) {
    MySize().init(context);
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        message: msg,
        barBlur: 2,
        messageColor: ThemeColors.bgColor,
        messageSize: MySize.size14,
        backgroundColor: color.withOpacity(0.5),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(seconds: 3),
        borderColor: color,
        borderWidth: 0.1,
        positionOffset: 20,
        icon: Icon(
          Icons.check_circle_rounded,
          size: MySize.size26,
          color: ThemeColors.bgColor,
        ),
        borderRadius: BorderRadius.circular(5),
      )..show(context),
    );
  }

  static flushBarSuccessForNegativeMessageWithIcon(
      String msg, BuildContext context, Color color, bool icon) {
    MySize().init(context);
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        message: msg,
        barBlur: 2,
        messageColor: ThemeColors.bgColor,
        messageSize: MySize.size12,
        backgroundColor: color,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(seconds: 3),
        borderColor: color,
        borderWidth: 0.1,
        positionOffset: 20,
        icon: Icon(
          icon == true ? Icons.check_circle_rounded : Icons.error,
          size: MySize.size26,
          color: ThemeColors.bgColor,
        ),
        borderRadius: BorderRadius.circular(5),
      )..show(context),
    );
  }
}

// Function to calculate distance between two coordinates using Haversine formula
double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371.0; // Earth's radius in kilometers

  // Convert latitude and longitude from degrees to radians
  double dLat = _degreesToRadians(lat2 - lat1);
  double dLon = _degreesToRadians(lon2 - lon1);

  // Calculate the distance using Haversine formula
  double a = pow(sin(dLat / 2), 2) +
      cos(_degreesToRadians(lat1)) *
          cos(_degreesToRadians(lat2)) *
          pow(sin(dLon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = R * c; // Distance in kilometers

  return distance;
}

// Helper function to convert degrees to radians
double _degreesToRadians(double degrees) {
  return degrees * pi / 180.0;
}

// Function to check if a branch is within a specified radius from the user's location
bool isBranchWithinRadius(double branchLat, double branchLon, double userLat,
    double userLon, double radiusKm) {
  double distance = calculateDistance(branchLat, branchLon, userLat, userLon);
  return distance <= radiusKm;
}
