import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../helper/mySize.dart';
import '../helper/theme_helper.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MySize.size180,
            height: MySize.size105,
            decoration: BoxDecoration(
                color: ThemeColors.navBarGrey,
                borderRadius: BorderRadiusDirectional.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(4, 0),
                      color: ThemeColors.primaryColor.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 10)
                ]),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      const SpinKitCircle(
                        color: Colors.white,
                        size: 50.0,
                      ),
                      SizedBox(height: MySize.size5),
                      "Please wait"
                          .text
                          .color(ThemeColors.primaryColor)
                          .size(MySize.size14)
                          .fontWeight(FontWeight.w600)
                          .textStyle(GoogleFonts.nunitoSans())
                          .make()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
