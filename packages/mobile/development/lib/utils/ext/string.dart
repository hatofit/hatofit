import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:oktoast/oktoast.dart';

extension StringExt on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  String? get capitalizeFirst {
    if (isEmpty) {
      return null;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  void toToastError(BuildContext context, {TextAlign? textAlign}) {
    try {
      final message = isEmpty ? "error" : this;

      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: Palette.redLatte,
          icon: Icons.error,
          message: message,
          textColor: Colors.white,
          textAlign: textAlign,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e, stackTrace) {
      FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
    }
  }

  void toToastSuccess(BuildContext context) {
    try {
      final message = isEmpty ? "success" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      // showToast(msg)
      showToastWidget(
        Toast(
          bgColor: Palette.greenLatte,
          icon: Icons.check_circle,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e, stackTrace) {
      FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
    }
  }

  void toToastLoading(BuildContext context) {
    try {
      final message = isEmpty ? "loading" : this;
      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: Theme.of(context).extension<AppColors>()?.pink,
          icon: Icons.info,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e, stackTrace) {
      FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
    }
  }

  String imageDeviceAssetDecision() {
    if (contains("Polar H10")) {
      return 'assets/images/polar/polar-h10.png';
    } else if (contains("Polar Sense")) {
      return 'assets/images/polar/polar-verity-sense.png';
    } else if (contains("Polar H9")) {
      return 'assets/images/polar/polar-h9.png';
    } else if (contains("Polar OH1")) {
      return 'assets/images/polar/polar-oh1.png';
    } else {
      return 'assets/images/other-device.png';
    }
  }

  String trMood(BuildContext ctx) {
    final str = Strings.of(ctx)!;
    switch (this) {
      case 'happy':
        return str.happy;
      case 'good':
        return str.good;
      case 'neutral':
        return str.neutral;
      case 'sad':
        return str.sad;
      case 'awful':
        return str.awful;
      default:
        return str.unknown;
    }
  }

  bool isPolar() {
    return contains("Polar");
  }

  String limitBrandName() {
    if (length > 11) {
      return "${substring(0, 11)}...";
    }
    return this;
  }

  // base64 to image
  Uint8List toImage() {
    return base64Decode(this);
  }
}
