import 'package:flutter/material.dart';
import '../../cores/helper/theme_helper.dart';
import 'splash_view.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SplashViewNew()));
      },
      child: Container(
        color: ThemeColors.pageBgColor,
      ),
    );
  }
}
