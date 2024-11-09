// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  bool passwordVisibbility = true;
  bool confirmPasswordVisibbility = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  File? profileImage;

  togglePasswordVisibility(bool value) {
    passwordVisibbility = value;
    notifyListeners();
  }

  toggleConfirmPasswordVisibility(bool value) {
    confirmPasswordVisibbility = value;
    notifyListeners();
  }

  changeLoaderValue(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> notifyAdmin(
      String userId, String notificationType, String title, String body) async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      var userName = userDoc['name'];
      {
        // Create a new document in the "notifications" collection
        final notificationRef =
            await FirebaseFirestore.instance.collection('notifications').add({
          'userId': userId,
          'userName': userName,
          'time': DateTime.now(),
          'notificationTitle': title,
          'notificationBody': body,
          'userReadStatus': false,
          'userDeleteStatus': false,
          'AdminReadStatus': false,
          'AdminDeleteStatus': false,
          'notificationType': notificationType,
        });

        debugPrint(
            'Notification created for user sign-in: ${notificationRef.id}');
      }
    } catch (error) {
      changeLoaderValue(false);
      debugPrint('Error creating notification: $error');
    }
  }

  // void createUserWithEmailAndPassword(
  //     BuildContext context, String name, String email, String password) async {
  //   CommonFunctions.closeKeyboard(context);
  //   changeLoaderValue(true);

  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     String userId = userCredential.user!.uid;
  //     String userDisplayId = generateCustomUserId();
  //     await FirebaseFirestore.instance.collection('users').doc(userId).set({
  //       'id': userId,
  //       'userDisplayId': userDisplayId,
  //       'name': name,
  //       'email': email,
  //       'joinedDate': Timestamp.now(),
  //       'subscrptionType': null,
  //       'subscriptionPaidPrice': null,
  //       'subscriptionTimestamp': null,
  //       'subscriptionExpiryTimestamp': null,
  //       'isUserLoggedIn': true,
  //       'isAccountDeleted': false,
  //       'loginType': "SignInWithEmailandPassword",
  //     }).then((value) async {
  //       try {
  //         await notifyAdmin(userId, "newUser", "New User",
  //             "A new user has recently joined the application");
  //       } catch (e) {
  //         debugPrint('Notifying new user error : ${e.toString()}');
  //       }

  //       changeLoaderValue(false);
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const BottomNavBarView()));
  //       debugPrint('New user signed up in app successfully.');
  //       CommonFunctions.flushBarSuccessMessage(
  //           "New user signed in successfully.", context);
  //     });
  //   } catch (e) {
  //     changeLoaderValue(false);
  //     CommonFunctions.flushBarErrorMessage(e.toString(), context);
  //   }
  // }

  String generateCustomUserId() {
    // Combine timestamp and random string for improved uniqueness

    final random = Random.secure();
    const String chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    List<String> characters = chars.split('');
    String randomString = '';
    for (int i = 0; i < 6; i++) {
      randomString += characters[random.nextInt(characters.length)];
    }
    return randomString;
  }
}
