import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_services/features/login/login_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../cores/helper/constant.dart';
import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../../cores/widgets/custom_buttons.dart';
import '../signup/signup_provider.dart';

class VerifyOTPView extends StatefulWidget {
  final int otpLength;
  const VerifyOTPView({super.key, required this.otpLength});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  late List<TextEditingController> otpControllers;
  late String fullOTP;
  late Timer _timer;
  int _remainingTime = 120; // 2 minutes in seconds

  @override
  void initState() {
    super.initState();
    otpControllers =
        List.generate(widget.otpLength, (_) => TextEditingController());
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String get formattedTime {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer<SignUpProvider>(
        builder: (context, signup, child) => SafeArea(
          child: Stack(
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
                        SizedBox(height: MySize.size15),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: MySize.size60),
                                AppLocalizations.of(context)!
                                    .verifyOTP
                                    .text
                                    .color(ThemeColors.black)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w500)
                                    .size(MySize.size17)
                                    .align(TextAlign.center)
                                    .makeCentered(),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.size55),
                        AppLocalizations.of(context)!
                            .enterOTP
                            .text
                            .color(ThemeColors.grey)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w400)
                            .size(MySize.size12)
                            .align(TextAlign.center)
                            .makeCentered(),
                        SizedBox(height: MySize.size3),
                        "+966 342 335678"
                            .text
                            .color(ThemeColors.black)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w400)
                            .size(MySize.size12)
                            .align(TextAlign.center)
                            .makeCentered(),
                        SizedBox(height: MySize.size20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              widget.otpLength,
                              (index) => _buildDigitContainer(
                                  index, otpControllers[index]),
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.size32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppLocalizations.of(context)!
                                    .timeRemaining
                                    .text
                                    .color(ThemeColors.grey)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w400)
                                    .size(MySize.size12)
                                    .align(TextAlign.center)
                                    .makeCentered(),
                                formattedTime.text
                                    .color(ThemeColors.grey)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w400)
                                    .size(MySize.size12)
                                    .align(TextAlign.center)
                                    .makeCentered(),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: _remainingTime == 0
                                      ? () {
                                          _timer.cancel();
                                          setState(() {
                                            _remainingTime =
                                                120; // Reset to 2 minutes
                                            startTimer();
                                          });
                                        }
                                      : null,
                                  child: AppLocalizations.of(context)!
                                      .reSend
                                      .text
                                      .color(_remainingTime == 0
                                          ? ThemeColors.primaryColor
                                          : ThemeColors.grey)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w400)
                                      .size(MySize.size12)
                                      .align(TextAlign.center)
                                      .makeCentered(),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: MySize.size22),
                        CustomButton8(
                          text: AppLocalizations.of(context)!.verify,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()));
                          },
                          backgroundColor: ThemeColors.primaryBlue,
                          textColor: ThemeColors.whiteColor,
                          radius: MySize.size10,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDigitContainer(int index, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MySize.size10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: ThemeColors.grey1.withOpacity(0.7),
            width: 1.0,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.3),
          //     spreadRadius: 1,
          //     blurRadius: 20,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          onChanged: (value) {
            if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
            } else if (value.length == 1 && index < widget.otpLength - 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
