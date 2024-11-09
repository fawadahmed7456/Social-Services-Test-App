import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/helper/common_functions.dart';
import '../../cores/helper/constant.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../../cores/widgets/custom_buttons.dart';
import '../../cores/widgets/custom_textfields.dart';
import '../login/login_view.dart';
import '../otp/verify_otp_view.dart';
import 'signup_provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer(
        builder: (context, SignUpProvider signup, child) => Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgSplash2), fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                child: Column(
                  children: [
                    SizedBox(height: MySize.size130),
                    Container(
                      width: MySize.size300,
                      height: MySize.size90,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgLogo), fit: BoxFit.cover)),
                    ),
                    SizedBox(height: MySize.size45),
                    AppLocalizations.of(context)!
                        .createAnAccount
                        .text
                        .color(ThemeColors.black)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w600)
                        .size(MySize.size16)
                        .makeCentered(),
                    SizedBox(height: MySize.size10),
                    AppLocalizations.of(context)!
                        .enterPhoneSignup
                        .text
                        .color(ThemeColors.testGrey)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w400)
                        .size(MySize.size12)
                        .makeCentered(),
                    SizedBox(height: MySize.size18),
                    Form(
                      key: signupKey,
                      child: Column(
                        children: [
                          CustomTextField14(
                              prefixIcon: Image.asset(imgPhone),
                              hintText:
                                  AppLocalizations.of(context)!.yourPhoneNumber,
                              fillColor: ThemeColors.whiteColor,
                              textColor: ThemeColors.black,
                              hintTextColor: ThemeColors.black,
                              radius: MySize.size10,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return CommonFunctions.validateTextField(
                                    value, context);
                              },
                              sufixIcon: Image.asset(imgCircularFlag)),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.size25),
                    CustomButton8(
                      text: AppLocalizations.of(context)!.createAccount,
                      onPressed: () {
                        if (signupKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VerifyOTPView(
                                        otpLength: 4,
                                      )));
                        }
                      },
                      backgroundColor: ThemeColors.primaryBlue,
                      textColor: ThemeColors.whiteColor,
                      radius: MySize.size10,
                    ),
                    SizedBox(height: MySize.size15),
                    AppLocalizations.of(context)!
                        .or
                        .text
                        .color(ThemeColors.testGrey)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w400)
                        .size(MySize.size12)
                        .makeCentered(),
                    SizedBox(height: MySize.size15),
                    Platform.isIOS
                        ? CustomSocialButton(
                            image: icApplelogo,
                            imageColor: ThemeColors.whiteColor,
                            text: AppLocalizations.of(context)!.signUpwithApple,
                            onPressed: () {},
                            backgroundColor: ThemeColors.black,
                            textColor: ThemeColors.whiteColor,
                            radius: MySize.size10,
                          )
                        : CustomSocialButton(
                            image: icGoogleLogo,
                            text:
                                AppLocalizations.of(context)!.signUpwithGoogle,
                            onPressed: () {},
                            backgroundColor: ThemeColors.lightButtonBg,
                            textColor: ThemeColors.whiteColor,
                            radius: MySize.size10,
                          ),
                    SizedBox(height: MySize.size20),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MySize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLocalizations.of(context)!
                        .alreadyHaveAccountCreate
                        .text
                        .color(ThemeColors.black)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w400)
                        .size(MySize.size10)
                        .make(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      },
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ThemeColors
                                  .primaryColor, // Set the color here
                              width: 1.0, // Set the width as needed
                            ),
                          ),
                        ),
                        child: AppLocalizations.of(context)!
                            .login
                            .text
                            .color(ThemeColors.primaryColor)
                            .textStyle(GoogleFonts.kanit())
                            .size(MySize.size10)
                            .make(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
