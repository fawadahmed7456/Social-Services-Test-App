import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_services/cores/helper/constant.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../cores/helper/mySize.dart';
import '../../cores/helper/theme_helper.dart';
import '../../cores/widgets/custom_buttons.dart';
import '../login/login_view.dart';
import 'components/stacked_containers.dart';

class OnBoardingViewNew extends StatefulWidget {
  const OnBoardingViewNew({super.key});

  @override
  State<OnBoardingViewNew> createState() => _OnBoardingViewNewState();
}

class _OnBoardingViewNewState extends State<OnBoardingViewNew>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> onboardingSlider2 = [
      imgFingerPrintScan,
      imgFingerPrintScan,
      imgFingerPrintScan,
    ];
    List<String> onboardingTextsPart1 = [
      "Join the app now ",
      "Social facilities "
    ];

    List<String> onboardingTextsPart2 = ["All in one click", "secure payments"];

    return Scaffold(
      backgroundColor: ThemeColors.primaryBlue,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MySize.safeHeight,
                  width: MySize.screenWidth,
                  child: PageView.builder(
                    itemCount: 2,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) => Stack(
                      children: [
                        SizedBox(
                          height: MySize.size1005,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 1500),
                            opacity: currentIndex == i ? 1.0 : 0.0,
                            child: Column(
                              children: [
                                currentIndex == 0
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            width: MySize.size500,
                                            height: MySize.size20,
                                          ),
                                          SizedBox(
                                            width: MySize.size600,
                                            height: MySize.size500,
                                            child: CarouselSlider(
                                              items: onboardingSlider2
                                                  .map((image) {
                                                return Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(image),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                );
                                              }).toList(),
                                              options: CarouselOptions(
                                                height: MySize.size500,
                                                autoPlay: true,
                                                onPageChanged:
                                                    (index, reason) {},
                                                viewportFraction:
                                                    0.6, // Adjust as needed
                                                aspectRatio:
                                                    16 / 9, // Adjust as needed
                                                reverse: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox(
                                        height: MySize.size500,
                                        child: const StackedContainers(),
                                      ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MySize.size26),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          onboardingTextsPart1[currentIndex]
                                              .text
                                              .textStyle(
                                                  GoogleFonts.calligraffitti())
                                              .color(ThemeColors.tertiaryBlue)
                                              .size(MySize.size30)
                                              .make(),
                                        ],
                                      ),
                                      onboardingTextsPart2[currentIndex]
                                          .text
                                          .textStyle(GoogleFonts.nunito())
                                          .color(ThemeColors.whiteColor)
                                          .size(MySize.size23)
                                          .make(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: MySize.screenHeight - MySize.size350,
              child: SizedBox(
                height: MySize.size320,
                width: MySize.screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size26),
                  child: Column(
                    children: [
                      SizedBox(height: MySize.size140),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            2, (index) => buildDots(context, index)),
                      ),
                      SizedBox(height: MySize.size20),
                      CustomButton8(
                        text: "Get Started",
                        backgroundColor: ThemeColors.secondaryBlue,
                        textColor: ThemeColors.whiteColor,
                        radius: MySize.size6,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                        },
                      ),
                      SizedBox(height: MySize.size15),
                      CustomButton8(
                        text: "Continue",
                        textColor: ThemeColors.whiteColor,
                        backgroundColor:
                            ThemeColors.tertiaryBlue.withOpacity(0.5),
                        radius: MySize.size6,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDots(BuildContext context, int index) {
    return Container(
      height: MySize.size5,
      width: currentIndex == index ? MySize.size40 : MySize.size14,
      margin: EdgeInsets.only(right: MySize.size5),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? ThemeColors.tertiaryBlue
            : ThemeColors.grey2,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
