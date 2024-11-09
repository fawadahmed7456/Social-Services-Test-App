// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_services/features/login/login_view.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/helper/constant.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../onboarding/onboarding_view_new.dart';
import 'splash_provider.dart';

class SplashViewNew extends StatefulWidget {
  const SplashViewNew({super.key});

  @override
  State<SplashViewNew> createState() => _SplashViewNewState();
}

class _SplashViewNewState extends State<SplashViewNew>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _horizontalAnimation;
  late Animation<double> _verticalAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  bool onboardingWatchedStatus = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Adjust duration as needed
    );

    _horizontalAnimation = Tween<double>(
      begin: 0.0, // Start from left (off-screen)
      end: 0.0, // End at the center (on-screen)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    ));

    _verticalAnimation = Tween<double>(
      begin: 1.0, // Start from bottom (off-screen)
      end: 0.0, // End at the center (on-screen)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.6, // Delay the start of text animation after 60% of the total animation
        1.0, // Ends at the end of the total animation
        curve: Curves.easeInOut,
      ),
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _animationController.forward();
        });
      }
    });

    _animationController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 3000), () async {
        User? currentUser = null;
        onboardingWatchedStatus =
            await Provider.of<SplashProviderNew>(context, listen: false)
                .getOnboardingWatchedStatus();
        debugPrint("onboardingWatchedStatus  : $onboardingWatchedStatus");
        if (currentUser != null) {
          debugPrint("Current User is Active");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
          );
        } else {
          debugPrint("No User is Acive");
          if (onboardingWatchedStatus) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingViewNew()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingViewNew()),
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.bluePrimary,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgSignUpBg), fit: BoxFit.fill)),
          ),
          Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(
                                _horizontalAnimation.value * MySize.size0,
                                _verticalAnimation.value * MySize.safeHeight),
                            child: Opacity(
                              opacity: _opacityAnimation.value,
                              child: Container(
                                width: MySize
                                    .size200, // Set your desired size here
                                height: MySize
                                    .size200, // Set your desired size here
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(imgFingerPrintScan),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size30 * _sizeAnimation.value,
                          ),
                          Opacity(
                            opacity: _textAnimation.value,
                            child: "Social Services App"
                                .text
                                .size(MySize.size20)
                                .color(ThemeColors.whiteColor)
                                .textStyle(GoogleFonts.nunitoSans())
                                .fontWeight(FontWeight.w900)
                                .letterSpacing(MySize.size2)
                                .makeCentered(),
                          ),
                          SizedBox(height: MySize.size5),
                          Opacity(
                            opacity: _textAnimation.value,
                            child: "Secure Payments"
                                .text
                                .size(MySize.size17)
                                .color(ThemeColors.tertiaryBlue)
                                .textStyle(GoogleFonts.calligraffitti())
                                .fontWeight(FontWeight.w600)
                                .letterSpacing(MySize.size2)
                                .makeCentered(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
