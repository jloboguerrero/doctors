import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Lottie.asset(
            'assets/green.json',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
