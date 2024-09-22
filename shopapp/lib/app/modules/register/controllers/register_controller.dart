import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopapp/app/data/provider/login_provider.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/secure_storage.dart';

class RegisterController extends GetxController {
  final LoginProvider loginProvider;
  final SecureStorage secureStorage;
  RegisterController( {required this.loginProvider, required this.secureStorage});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var file = Rxn<File>();
  final isPasswordHidden = false.obs;
  final isConfirmPasswordHidden = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void pickImage({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      var image = await ImagePicker().pickImage(source: imageSource, imageQuality: 100, );
      if(image == null) return;
      final imageTemp = File(image.path);
      file.value = imageTemp;
    } on PlatformException catch(e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void register() async {
    try {
      if (formKey.currentState!.validate() && file.value != null) {
        formKey.currentState!.save();
        isLoading.value = true;
        await loginProvider.register(
          emailController.text,
          passwordController.text,
          file.value!,
        );
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar('Succès', 'Compte créé avec succès');
      }
    }catch(e){
      print("e $e");
      Get.snackbar('Error',  e.toString(),);

    } finally {
      isLoading.value = false;
    }
  }
}
