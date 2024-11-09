import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_services/features/passkey/auth_success_view.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/helper/constant.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../../cores/widgets/custom_buttons.dart';
import 'passkey_provider.dart';

class PasskeyView extends StatefulWidget {
  const PasskeyView({super.key});

  @override
  State<PasskeyView> createState() => _PasskeyViewState();
}

class _PasskeyViewState extends State<PasskeyView>
    with TickerProviderStateMixin {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Makes the animation repeat back and forth.

    // Set up the vertical animation (up and down movement)
    _animation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
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
                                        SizedBox(height: MySize.size34),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppLocalizations.of(context)!
                                                .passkeySignin
                                                .text
                                                .color(ThemeColors.whiteColor)
                                                .textStyle(
                                                    GoogleFonts.nunitoSans())
                                                .fontWeight(FontWeight.w900)
                                                .size(MySize.size20)
                                                .make(),
                                          ],
                                        ),
                                        SizedBox(height: MySize.size2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppLocalizations.of(context)!
                                                .placeFinger
                                                .text
                                                .color(ThemeColors.whiteColor)
                                                .textStyle(
                                                    GoogleFonts.nunitoSans())
                                                .fontWeight(FontWeight.w500)
                                                .size(MySize.size9)
                                                .make(),
                                          ],
                                        ),
                                        SizedBox(height: MySize.size45),
                                        GestureDetector(
                                          onLongPress: () {
                                            _controller.forward();
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              _controller.reverse();
                                            });
                                            Future.delayed(
                                                const Duration(seconds: 5), () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AuthSuccessView()),
                                                (Route<dynamic> route) => false,
                                              );
                                            });
                                          },
                                          onTapDown: (_) {
                                            // Start the animation when the user presses down
                                            _controller.forward();
                                          },
                                          onTapUp: (_) {
                                            // Stop the animation when the user lifts their finger
                                            _controller.reverse();
                                          },
                                          onTapCancel: () {
                                            // Stop the animation if the touch is canceled (e.g., user lifts finger quickly)
                                            _controller.reverse();
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                imgFingerPrintScan,
                                                scale: 0.8,
                                              ),
                                              // Animated vertical line
                                              AnimatedBuilder(
                                                animation: _animation,
                                                builder: (context, child) {
                                                  return Positioned(
                                                    top: 70 +
                                                        _animation.value * 4,
                                                    child: Container(
                                                      width: 80,
                                                      height:
                                                          2, // Length of the line
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: ThemeColors
                                                                  .transparentBlue,
                                                              boxShadow: [
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    5, 2),
                                                                color:
                                                                    ThemeColors
                                                                        .bgColor,
                                                                blurRadius: 15,
                                                                spreadRadius: 2)
                                                          ]),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MySize.size45),
                                        CustomButton8(
                                            text: AppLocalizations.of(context)!
                                                .cancel,
                                            backgroundColor:
                                                ThemeColors.primaryBlue,
                                            textColor: ThemeColors.whiteColor,
                                            radius: MySize.size6,
                                            onPressed: () {}),
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
