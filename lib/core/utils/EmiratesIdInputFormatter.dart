import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmiratesIdInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'\s'), '');

    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i == 3 || i == 7 || i == 14) {
        formattedText += ' ';
      }
      if (i >= 15) {
        // Restrict further input after the last digit
        break;
      }
      formattedText += newText[i];
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}