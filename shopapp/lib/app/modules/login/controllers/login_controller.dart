import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = false.obs;

  get formKey => _formKey;


  @override
  void onInit() {
    super.onInit();
  }

  void onSubmitted() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
     // Get.toNamed(AppRoutes.home);
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


}
