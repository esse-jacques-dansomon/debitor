import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DebitController extends GetxController {
  //TODO: Implement DebitController
  final clientId = TextEditingController();
  final amount = TextEditingController();
  final selectedValue = Rxn<String>(null);

  void setSelectedValue(String? value) {
    if (value == null) return;
    selectedValue.value = value;
  }
}
