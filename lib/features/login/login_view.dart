import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_services/features/passkey/passkey_view.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/helper/constant.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../../cores/widgets/custom_buttons.dart';
import '../../cores/widgets/custom_textfields.dart';
import 'login_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer(
        builder: (context, LoginProvider login, child) => Stack(
          children: [
            // Outer container with gradient background (not affected by blur)
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgSignUpBg), fit: BoxFit.fill)),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: MySize.size120),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: MySize.size20),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ThemeColors.gradientColor1,
                                      ThemeColors.gradientColor2
                                    ]),
                                border: Border.all(
                                    color: ThemeColors.transparentBlue),
                                borderRadius:
                                    BorderRadius.circular(MySize.size24)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(MySize.size24),
                              child: Stack(
                                children: [
                                  // Applying the blur only to the inner container's background
                                  Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 6, sigmaY: 6),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(
                                              0.1), // Slight opacity for background
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Inner content (text fields, buttons, etc.) on top of the blurred background
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        MySize.size32,
                                        MySize.size34,
                                        MySize.size32,
                                        MySize.size34),
                                    child: Column(
                                      children: [
                                        AppLocalizations.of(context)!
                                            .spiral
                                            .text
                                            .color(ThemeColors.whiteColor)
                                            .textStyle(GoogleFonts.nunitoSans())
                                            .fontWeight(FontWeight.w900)
                                            .size(MySize.size26)
                                            .make(),
                                        SizedBox(height: MySize.size34),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppLocalizations.of(context)!
                                                .login
                                                .text
                                                .color(ThemeColors.whiteColor)
                                                .textStyle(
                                                    GoogleFonts.nunitoSans())
                                                .fontWeight(FontWeight.w900)
                                                .size(MySize.size20)
                                                .make(),
                                          ],
                                        ),
                                        SizedBox(height: MySize.size20),
                                        CustomTextField14(
                                          title: AppLocalizations.of(context)!
                                              .email,
                                          radius: MySize.size5,
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .emailHint,
                                        ),
                                        SizedBox(height: MySize.size12),
                                        CustomTextField14(
                                          title: AppLocalizations.of(context)!
                                              .password,
                                          radius: MySize.size5,
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .password,
                                        ),
                                        SizedBox(height: MySize.size25),
                                        CustomButton8(
                                            text: AppLocalizations.of(context)!
                                                .signin,
                                            backgroundColor:
                                                ThemeColors.primaryBlue,
                                            textColor: ThemeColors.whiteColor,
                                            radius: MySize.size6,
                                            onPressed: () {}),
                                        SizedBox(height: MySize.size20),
                                        AppLocalizations.of(context)!
                                            .or
                                            .text
                                            .color(ThemeColors.whiteColor)
                                            .textStyle(GoogleFonts.nunitoSans())
                                            .fontWeight(FontWeight.w500)
                                            .size(MySize.size11)
                                            .make(),
                                        SizedBox(height: MySize.size20),
                                        CustomSocialButton(
                                            text: AppLocalizations.of(context)!
                                                .signInWithPassKey,
                                            radius: MySize.size6,
                                            textColor: ThemeColors.primaryBlue,
                                            backgroundColor:
                                                ThemeColors.whiteColor,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PasskeyView()));
                                            },
                                            image: icFingerPrint),
                                        SizedBox(height: MySize.size20),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: CustomSocialButton(
                                                    text: "",
                                                    radius: MySize.size6,
                                                    textColor:
                                                        ThemeColors.primaryBlue,
                                                    backgroundColor:
                                                        ThemeColors.whiteColor,
                                                    onPressed: () {},
                                                    image: icGoogleLogo),
                                              ),
                                              SizedBox(width: MySize.size15),
                                              Expanded(
                                                child: CustomSocialButton(
                                                    text: "",
                                                    radius: MySize.size6,
                                                    textColor:
                                                        ThemeColors.primaryBlue,
                                                    backgroundColor:
                                                        ThemeColors.whiteColor,
                                                    onPressed: () {},
                                                    image: icGithubLogo),
                                              ),
                                            ]),
                                        SizedBox(height: MySize.size20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppLocalizations.of(context)!
                                                .dontHaveAccountCreate
                                                .text
                                                .color(ThemeColors.whiteColor)
                                                .textStyle(
                                                    GoogleFonts.nunitoSans())
                                                .fontWeight(FontWeight.w400)
                                                .size(MySize.size10)
                                                .make(),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginView()));
                                              },
                                              child: DecoratedBox(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: ThemeColors
                                                          .tertiaryBlue, // Set the color here
                                                      width:
                                                          1.0, // Set the width as needed
                                                    ),
                                                  ),
                                                ),
                                                child: AppLocalizations.of(
                                                        context)!
                                                    .register
                                                    .text
                                                    .color(ThemeColors
                                                        .tertiaryBlue)
                                                    .textStyle(
                                                        GoogleFonts.kanit())
                                                    .size(MySize.size10)
                                                    .make(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 20,
                        child: SizedBox(
                          height: MySize.size150,
                          width: MySize.size150,
                          child: Image.asset(
                            imgTopLayer,
                          ),
                        ))
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
