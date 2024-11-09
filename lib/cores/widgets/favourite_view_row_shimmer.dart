import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helper/mySize.dart';
import '../helper/theme_helper.dart';

class FavouriteViewRowShimmer extends StatelessWidget {
  const FavouriteViewRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacing.horizontal(MySize.size32),
      child: Container(
        width: double.infinity,
        height: MySize.size71,
        decoration: ShapeDecoration(
          color: ThemeColors.bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 10,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: Spacing.horizontal(MySize.size10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      period: const Duration(milliseconds: 700),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: MySize.size60,
                        height: MySize.size60,
                        // color: Colors.grey.shade300,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white,
                              Colors.grey.withOpacity(0.2)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MySize.size16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          period: const Duration(milliseconds: 700),
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: MySize.size200,
                            height: MySize.size20,
                            // color: Colors.grey.shade300,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.white,
                                  Colors.grey.withOpacity(0.2)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.size6),
                        Shimmer.fromColors(
                          period: const Duration(milliseconds: 700),
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: MySize.size150,
                            height: MySize.size20,
                            // color: Colors.grey.shade300,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.white,
                                  Colors.grey.withOpacity(0.2)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Shimmer.fromColors(
                period: const Duration(milliseconds: 700),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: MySize.size30,
                  height: MySize.size30,
                  // color: Colors.grey.shade300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white, Colors.grey.withOpacity(0.2)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
