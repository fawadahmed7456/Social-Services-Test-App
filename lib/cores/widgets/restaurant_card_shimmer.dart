import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helper/mySize.dart';
import '../helper/theme_helper.dart';

class RestaurantCardShimmer extends StatelessWidget {
  const RestaurantCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // debugPrint('$name ::::: isFavourite= $isFavourite');
    return Padding(
      padding: Spacing.horizontal(MySize.size32),
      child: Container(
        width: double.infinity,
        height: MySize.size190,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  Colors.grey.withOpacity(0.2) // Colors.grey.withOpacity(0.3)
              ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                            color: ThemeColors
                                .bgColor //Colors.grey                                .withOpacity(0.12) // ThemeColors.grey3,
                            )),
                  ),
                ),
                SizedBox(height: MySize.size20),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: Spacing.horizontal(MySize.size20),
                        child: Shimmer.fromColors(
                          period: const Duration(milliseconds: 700),
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: MySize.size200,
                            height: MySize.size30,
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
                      ),
                      SizedBox(height: MySize.size10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: Spacing.horizontal(MySize.size20),
                            child: Shimmer.fromColors(
                              period: const Duration(milliseconds: 700),
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: MySize.size150,
                                height: MySize.size20,
                                // color: Colors.grey.shade300,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
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
                          ),
                          const Spacer(),
                          Padding(
                            padding: Spacing.horizontal(MySize.size20),
                            child: Shimmer.fromColors(
                              period: const Duration(milliseconds: 700),
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: MySize.size80,
                                height: MySize.size20,
                                // color: Colors.grey.shade300,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
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
                          ),
                        ],
                      ),
                      SizedBox(height: MySize.size10),
                    ],
                  ),
                ),
                Container(
                  height: MySize.size60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1), // ThemeColors.grey1,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: Spacing.horizontal(MySize.size20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: Spacing.horizontal(MySize.size0),
                            child: Shimmer.fromColors(
                              period: const Duration(milliseconds: 700),
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: MySize.size180,
                                height: MySize.size25,
                                // color: Colors.grey.shade300,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
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
                          ),
                        ),
                        SizedBox(width: MySize.size20),
                        Padding(
                          padding: Spacing.horizontal(MySize.size20),
                          child: Shimmer.fromColors(
                            period: const Duration(milliseconds: 700),
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: MySize.size25,
                              height: MySize.size25,
                              // color: Colors.grey.shade300,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
