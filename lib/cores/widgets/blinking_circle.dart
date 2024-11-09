import 'dart:async';
import 'package:flutter/material.dart';
import 'package:social_services/cores/helper/mySize.dart';
import 'package:social_services/cores/helper/theme_helper.dart';

class BlinkingCircle extends StatefulWidget {
  final bool showCircle;

  const BlinkingCircle({super.key, required this.showCircle});

  @override
  BlinkingCircleState createState() => BlinkingCircleState();
}

class BlinkingCircleState extends State<BlinkingCircle> {
  bool _isVisible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.showCircle) {
      _startBlinking();
    }
  }

  @override
  void didUpdateWidget(BlinkingCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showCircle && oldWidget.showCircle != widget.showCircle) {
      _startBlinking();
    } else if (!widget.showCircle) {
      _stopBlinking();
    }
  }

  void _startBlinking() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  void _stopBlinking() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopBlinking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: MySize.size10,
        height: MySize.size10,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeColors.primaryBlue,
        ),
      ),
    );
  }
}
