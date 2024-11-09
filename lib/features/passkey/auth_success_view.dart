import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_services/features/home/home_view.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/helper/constant.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../../cores/widgets/custom_buttons.dart';
import 'passkey_provider.dart';

class AuthSuccessView extends StatefulWidget {
  const AuthSuccessView({super.key});

  @override
  State<AuthSuccessView> createState() => _AuthSuccessViewState();
}

class _AuthSuccessViewState extends State<AuthSuccessView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer(
        builder: (context, PasskeyProvider login, child) => Stack(
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
                                        SizedBox(height: MySize.size45),
                                        Image.asset(imgSuccessCheck),
                                        SizedBox(height: MySize.size30),
                                        AppLocalizations.of(context)!
                                            .authSuccess
                                            .text
                                            .color(ThemeColors.whiteColor)
                                            .textStyle(GoogleFonts.nunitoSans())
                                            .fontWeight(FontWeight.w800)
                                            .size(MySize.size26)
                                            .make(),
                                        SizedBox(height: MySize.size60),
                                        AppLocalizations.of(context)!
                                            .redirectingToAccount
                                            .text
                                            .color(ThemeColors.whiteColor)
                                            .textStyle(GoogleFonts.nunitoSans())
                                            .fontWeight(FontWeight.w400)
                                            .size(MySize.size17)
                                            .make(),
                                        SizedBox(height: MySize.size65),
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
