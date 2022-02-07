import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }
}
