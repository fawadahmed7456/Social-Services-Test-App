import 'dart:math';
import 'package:flutter/material.dart';

import '../../../cores/helper/constant.dart';
import '../../../cores/helper/mySize.dart';

class StackedContainers extends StatefulWidget {
  const StackedContainers({super.key});

  @override
  State<StackedContainers> createState() => _StackedContainersState();
}

class _StackedContainersState extends State<StackedContainers> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: MySize.size50,
          child: Transform.rotate(
            angle: pi / 11.5, // 20 degrees in radians (counterclockwise)
            child: Row(
              children: [
                SizedBox(width: MySize.size220),
                Container(
                  width: MySize.size300,
                  height: MySize.size400,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(onboadring2img2),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(MySize.size40),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MySize.size0,
          child: Transform.rotate(
            angle: -pi / 9, // 20 degrees in radians (clockwise)
            child: Row(
              children: [
                Container(
                  width: MySize.size300,
                  height: MySize.size376,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(onboadring2img1),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(MySize.size40),
                  ),
                ),
                SizedBox(width: MySize.size200),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
