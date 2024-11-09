// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

class PasskeyProvider with ChangeNotifier {
  bool passwordVisibbility = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetPasswordEmailController = TextEditingController();

  togglePasswordVisibility(bool value) {
    passwordVisibbility = value;
    notifyListeners();
  }

  changeLoaderValue(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // void signInWithEmailAndPassword(
  //   BuildContext context,
  //   String email,
  //   String password,
  // ) async {
  //   CommonFunctions.closeKeyboard(context);
  //   changeLoaderValue(true);
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: email)
  //         .get()
  //         .then((snapshot) async {
  //       if (snapshot.docs.isNotEmpty) {
  //         if (snapshot.docs.first.data()['isAccountDeleted']) {
  //           changeLoaderValue(false);
  //           CommonFunctions.flushBarErrorMessage(
  //               "Your account has been deleted Kindly contact the customer support",
  //               context);
  //           return 0;
  //         }
  //         await FirebaseAuth.instance
  //             .signInWithEmailAndPassword(email: email, password: password);

  //         changeLoaderValue(false);

  //         Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (context) => const BottomNavBarView()),
  //             (route) => false);
  //         debugPrint('User signed in successfully.');
  //         CommonFunctions.flushBarSuccessMessage(
  //           "User signed in successfully.",
  //           context,
  //         );
  //       } else {
  //         changeLoaderValue(false);
  //         CommonFunctions.flushBarErrorMessage(
  //             "The entered email is not registered against any user. Please enter a valid email",
  //             context);
  //         return 0;
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint('Error signing in: $e');
  //     String errorMessage = "An error occurred while signing in.";
  //     debugPrint("Error code : ${e.code}");
  //     if (e.code == 'user-not-found') {
  //       errorMessage =
  //           "The entered email is not registered against any user. Please enter a valid email";
  //     } else if (e.code == 'invalid-credential') {
  //       errorMessage =
  //           "The entered password is not correct. Please enter a valid password";
  //     } else if (e.code == "too-many-requests") {
  //       errorMessage = "Too many attempts. Please try later";
  //     }
  //     CommonFunctions.flushBarErrorMessage(errorMessage, context);
  //     changeLoaderValue(false);
  //   } catch (e) {
  //     debugPrint('Error signing in: $e');
  //     CommonFunctions.flushBarErrorMessage(
  //       "An unexpected error occurred. Please try again later.",
  //       context,
  //     );
  //     changeLoaderValue(false);
  //   }
  // }

  // void signInWithGoogle(BuildContext context) async {
  //   CommonFunctions.closeKeyboard(context);
  //   changeLoaderValue(true);
  //   try {
  //     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       changeLoaderValue(false);
  //       CommonFunctions.flushBarErrorMessage(
  //           "Google sign in cancelled", context);
  //       return;
  //     } else {
  //       GoogleSignInAuthentication signInAuthentication =
  //           await googleUser.authentication;
  //       OAuthCredential credential = GoogleAuthProvider.credential(
  //           accessToken: signInAuthentication.accessToken,
  //           idToken: signInAuthentication.idToken);
  //       await FirebaseAuth.instance
  //           .signInWithCredential(credential)
  //           .then((value) async {
  //         var currentUser = FirebaseAuth.instance.currentUser;
  //         if (currentUser != null) {
  //           String userId = currentUser.uid;
  //           String userDisplayId = generateCustomUserId();
  //           await FirebaseFirestore.instance
  //               .collection('users')
  //               .doc(userId)
  //               .get()
  //               .then((docSnapshot) async {
  //             if (!docSnapshot.exists) {
  //               // Check if user document exists
  //               await FirebaseFirestore.instance
  //                   .collection('users')
  //                   .doc(userId)
  //                   .set({
  //                 'id': userId,
  //                 'userDisplayId': userDisplayId,
  //                 'name': FirebaseAuth.instance.currentUser!.displayName,
  //                 'email': FirebaseAuth.instance.currentUser!.email,
  //                 'joinedDate':
  //                     Timestamp.now(), // Set joinedDate only on first sign-in
  //                 'subscrptionType': null,
  //                 'subscriptionPaidPrice': null,
  //                 'subscriptionTimestamp': null,
  //                 'subscriptionExpiryTimestamp': null,
  //                 'isUserLoggedIn': true,
  //                 'isAccountDeleted': false,
  //                 'loginType': "SignInWithGoogle",
  //               }).then((value) {
  //                 changeLoaderValue(false);
  //                 Navigator.pushAndRemoveUntil(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => const BottomNavBarView()),
  //                     (route) => false);

  //                 debugPrint('User signed in with Google successfully.');
  //                 CommonFunctions.flushBarSuccessMessage(
  //                     "User signed in with Google successfully.", context);
  //               });
  //             } else {
  //               // User already exists, no need to update joinedDate
  //               if (docSnapshot.data()!['isAccountDeleted']) {
  //                 changeLoaderValue(false);
  //                 CommonFunctions.flushBarErrorMessage(
  //                     "Your account has been deleted Kindly contact the customer support",
  //                     context);
  //                 return 0;
  //               }
  //               changeLoaderValue(false);
  //               debugPrint('User signed in with Google successfully.');
  //               Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const BottomNavBarView()),
  //                   (route) => false);
  //               debugPrint('User signed in with Google successfully.');
  //               CommonFunctions.flushBarSuccessMessage(
  //                   "User signed in with Google successfully.", context);
  //             }
  //           });
  //         }
  //       });
  //     }
  //   } catch (e) {
  //     changeLoaderValue(false);
  //     debugPrint('Error signing in with Google: $e');
  //     CommonFunctions.flushBarErrorMessage(
  //         "An error occurred while signing in with Google. ${e.toString()}",
  //         context);
  //   }
  // }

  // void signInWithApple(BuildContext context) async {
  //   changeLoaderValue(true);
  //   try {
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     final oauthCredential = OAuthProvider("apple.com").credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );

  //     await FirebaseAuth.instance
  //         .signInWithCredential(oauthCredential)
  //         .then((value) async {
  //       if (value.user != null) {
  //         /// No Check Whether User Exist or Not

  //         /// First Time Registration
  //         {
  //           FirebaseAuth auth = FirebaseAuth.instance;

  //           {
  //             await FirebaseFirestore.instance
  //                 .collection('users')
  //                 .doc(auth.currentUser!.uid)
  //                 .set({
  //               'id': auth.currentUser!.uid,
  //               'userDisplayId': auth.currentUser!.displayName,
  //               'name': FirebaseAuth.instance.currentUser!.displayName,
  //               'email': FirebaseAuth.instance.currentUser!.email,
  //               'joinedDate':
  //                   Timestamp.now(), // Set joinedDate only on first sign-in
  //               'subscrptionType': null,
  //               'subscriptionPaidPrice': null,
  //               'subscriptionTimestamp': null,
  //               'subscriptionExpiryTimestamp': null,
  //               'isUserLoggedIn': true,
  //               'isAccountDeleted': false,
  //               'loginType': "SignInWithGoogle",
  //             }).then((value) {
  //               changeLoaderValue(false);
  //               Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const BottomNavBarView()),
  //                   (route) => false);
  //               debugPrint('User signed in with Google successfully.');
  //               CommonFunctions.flushBarSuccessMessage(
  //                   "User signed in with Google successfully.", context);
  //             });
  //           }
  //         }
  //       } else {
  //         changeLoaderValue(false);
  //         FirebaseAuth.instance.signOut();
  //         // changeShowLoaderValue(false);
  //         Navigator.pop(context); //remove Loader
  //         CommonFunctions.flushBarErrorMessage("Error Sigining In", context);
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     changeLoaderValue(false);
  //     // changeShowLoaderValue(false);
  //     Navigator.pop(context); //remove Loader
  //     CommonFunctions.flushBarErrorMessage(e.toString(), context);
  //   } catch (error) {
  //     changeLoaderValue(false);
  //     debugPrint("Apple Sign-In Error: $error");
  //     // changeShowLoaderValue(false);
  //     Navigator.pop(context); //remove Loader
  //     CommonFunctions.flushBarErrorMessage(e.toString(), context);
  //   }
  // }

  // void forgetPassword(BuildContext context) async {
  //   CommonFunctions.closeKeyboard(context);
  //   changeLoaderValue(true);
  //   try {
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(
  //             email: resetPasswordEmailController.text.trim())
  //         .then((value) {
  //       emailController.clear();

  //       Navigator.pop(context);
  //       CommonFunctions.flushBarSuccessMessage(
  //           "A password reset email has been sent to the entered email please check!",
  //           context);
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginView()));
  //       changeLoaderValue(false);
  //       CommonFunctions.flushBarSuccessMessage(
  //           "A password reset email has been sent to the entered email please check!",
  //           context);
  //     });
  //   } catch (e) {
  //     debugPrint('Error resetting password: $e');
  //     changeLoaderValue(false);
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const LoginView()));
  //     CommonFunctions.flushBarErrorMessage(
  //         "An error occurred while resetting password: ${e.toString()}",
  //         context);
  //   }
  // }

  // String generateCustomUserId() {
  //   // Combine timestamp and random string for improved uniqueness

  //   final random = Random.secure();
  //   const String chars =
  //       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
  //   List<String> characters = chars.split('');
  //   String randomString = '';
  //   for (int i = 0; i < 6; i++) {
  //     randomString += characters[random.nextInt(characters.length)];
  //   }
  //   return randomString;
  // }
}
