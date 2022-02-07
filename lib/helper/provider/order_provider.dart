import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nameInCardController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cvvController = TextEditingController();
  final yearController = TextEditingController();
  int orderId = 1;
  int curStep = 2;

  bool isLoading = false;

  changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }
}