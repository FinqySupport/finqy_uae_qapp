

import 'package:flutter/services.dart';

class Vibration {
  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>('HapticFeedback.vibrate');
  }
}


