String formatSelectedDateTime(DateTime selectedDateTime) {
  DateTime now = DateTime.now();
  Duration difference = selectedDateTime.difference(now);

  if (selectedDateTime.year == now.year &&
      selectedDateTime.month == now.month &&
      selectedDateTime.day == now.day) {
    // Same date as current date
    if (difference.inMinutes <= 15) {
      return 'Now (${difference.inMinutes + 45} min)';
    } else {
      return 'Scheduled (${selectedDateTime.hour}:${selectedDateTime.minute < 10 ? '0${selectedDateTime.minute}' : selectedDateTime.minute} ${selectedDateTime.hour < 12 ? 'AM' : 'PM'})';
    }
  } else {
    // Different date than current date
    return 'Scheduled (${selectedDateTime.day} ${_getMonthName(selectedDateTime.month)}, ${selectedDateTime.hour}:${selectedDateTime.minute < 10 ? '0${selectedDateTime.minute}' : selectedDateTime.minute} ${selectedDateTime.hour < 12 ? 'AM' : 'PM'})';
  }
}

// Future<void> selectDateTime(BuildContext context) async {
//   final cartProvider = Provider.of<CartProvider>(context, listen: false);

//   DateTime currentDateTime = DateTime.now();

//   final selectedDate = await showDatePicker(
//     context: context,
//     initialDate: cartProvider.selectedDateTime,
//     firstDate: currentDateTime,
//     lastDate: DateTime(currentDateTime.year + 1),
//     builder: (context, child) {
//       return Theme(
//         data: Theme.of(context).copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: ThemeColors.mainColor, // header background color
//             //  onPrimary: Colors.black, // header text color
//             onSurface: ThemeColors.black1, // body text color
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(
//               foregroundColor: ThemeColors.mainColor, // button text color
//             ),
//           ),
//         ),
//         child: child!,
//       );
//     },
//   );

//   if (selectedDate != null) {
//     TimeOfDay initialTime = TimeOfDay.now();
//     if (selectedDate.year == currentDateTime.year &&
//         selectedDate.month == currentDateTime.month &&
//         selectedDate.day == currentDateTime.day) {
//       // If selected date is the current date, set initialTime to the current time
//       initialTime = TimeOfDay.fromDateTime(currentDateTime);
//     }

//     final selectedTime = await showTimePicker(
//       context: context,
//       initialTime: initialTime,
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//                 primary: ThemeColors.mainColor
//                     .withOpacity(0.8), // header background color
//                 //  onPrimary: Colors.black, // header text color
//                 onSurface: ThemeColors.black1, // body text color
//                 secondary: ThemeColors.mainColor.withOpacity(0.3)),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: ThemeColors.mainColor,
//                 // button text color
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (selectedTime != null) {
//       DateTime selectedDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         selectedTime.hour,
//         selectedTime.minute,
//       );

//       // Check if the selectedDateTime is after the currentDateTime
//       if (selectedDateTime.isAfter(currentDateTime)) {
//         cartProvider.setselectedDateTime(selectedDateTime);
//         cartProvider.setSelectedDateChanges(true);
//         debugPrint("${cartProvider.selectedDateTime}");
//       } else {
//         // Show an error message or handle the case where the user selects a previous time
//         // For example:
//         CommonFunctions.flushBarSuccessForNegativeMessageWithIcon(
//             'Please select a time in the future',
//             context,
//             ThemeColors.mainColor,
//             false);
//       }
//     }
//   }
// }

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}
