import 'package:flutter/material.dart';

extension NavigationConfig on BuildContext {
  void pop({Object? data}) => Navigator.of(this).pop(data);

  Future pushNamedReplacement(String name, {Object? arguments}) async =>
      await Navigator.pushReplacementNamed(this, name, arguments: arguments);

  Future pushNamed(String name, {Object? arguments}) async =>
      await Navigator.pushNamed(this, name, arguments: arguments);

  Future pushNamedAndRemoveUntil(String name, {Object? arguments}) async =>
      await Navigator.pushNamedAndRemoveUntil(this, name, (route) => false, arguments: arguments);
}
