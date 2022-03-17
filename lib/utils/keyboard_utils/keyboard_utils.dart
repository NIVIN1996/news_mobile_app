import 'package:flutter/material.dart';

void removeKeyboardFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void clearText(TextEditingController controller) {
  controller.clear();
  removeKeyboardFocus();
}