import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
  bool isValidEmail() {
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
    return isValid;
  }

  bool isValidNumber() {
    bool isValid = RegExp(r'(^[0-9]{10}$)').hasMatch(this);
    return isValid;
  }
}

extension ContextExtension on BuildContext {
  showSuccessSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF6F82DE),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
                fit: FlexFit.loose,
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                )),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  showFailureSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                )),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
