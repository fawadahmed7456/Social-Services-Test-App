import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProviderNew with ChangeNotifier {
  Future<bool> getOnboardingWatchedStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingWatchedStatus') ?? false;
  }
}
