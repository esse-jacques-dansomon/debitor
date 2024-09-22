import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopapp/app/routes/app_pages.dart';

import '../../../data/model/user_model.dart';
import '../../../data/provider/login_provider.dart';
import '../../../utils/secure_storage.dart';

class AuthController extends GetxController {
  final LoginProvider loginProvider;
  final SecureStorage secureStorage;
  AuthController( {required this.loginProvider, required this.secureStorage});

  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = true.obs;


  var isLoading = false.obs;
  var isLoginSuccess = false.obs;
  var user = Rxn<User>();




  @override
  Future<void> onInit() async {
    super.onInit();
   await loadUserFromStorage();
  }
  // Charger l'utilisateur depuis le stockage sécurisé au démarrage
  Future<void> loadUserFromStorage() async {
    String? token = await secureStorage.getToken();
    print("token $token");
    if (token != null) {
      try {
        // Supposez que votre API a un endpoint pour obtenir les informations de l'utilisateur
        User fetchedUser = await loginProvider.getUser();

        user.value = fetchedUser;
        isLoginSuccess.value = true;
      } catch (e) {
        print("e $e");
        // Si le token est invalide ou expiré
        //await logout();
      }
    }
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try{
        isLoading.value = true;
        final  authResponse =  await loginProvider.login(emailController.text, passwordController.text);
        print("authResponse $authResponse");
        //set user to state
        user.value = authResponse.user;
        isLoading.value = false;
        isLoginSuccess.value = true;
        //save user and token
        secureStorage.persistUserAndToken(authResponse);
        Get.offAllNamed(Routes.HOME);
        Get.snackbar('Success', 'Login Successful', snackPosition: SnackPosition.BOTTOM);
      }catch(e){
        print("e $e");
        Get.snackbar('Error',  e.toString(),);
      } finally {
        isLoading.value = false;
      }
    }
  }


  // Méthode de déconnexion
  Future<void> logout() async {
    await secureStorage.deleteAll();
    user.value = null;
    isLoginSuccess.value = false;
    // Naviguer vers la page de connexion
    Get.offAllNamed(Routes.LOGIN);
    Get.snackbar('Succès', 'Déconnexion réussie');
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }



}
