import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/app/routes/app_pages.dart';

import '../../../themes/theme_colors.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  AuthController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset("assets/lotties/login.json"),
              ),
            ),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Connexion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: ThemeColor.primaryBlack,
                        fontWeight: FontWeight.w600)),

                Text('Veuillez vous authentifier pour continuer', style: TextStyle(color: Colors.grey, fontSize: 16),),
              ],
            ),

            const SizedBox(
              height: 40,
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(color: ThemeColor.primaryBlack),

                          suffixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ThemeColor.primaryBlue),
                          ),),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordHidden.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: ThemeColor.primaryBlue),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),


                    // Bouton de Connexion
                    Obx(
                          () =>
                        SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                onPressed: controller.isLoading.value ? null : () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.login();
                            } },
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(ThemeColor.primaryBlue),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),),
                              child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                                                    )
                              : const Center(
                                child: Text(
                                                            'Se connecter',
                                                            style: TextStyle(fontSize: 14),
                                                      ),
                              ),
                                                  ),
                          ),
                    ),
                  ],
                )),



            Container(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pas encore inscrit ?', style: TextStyle(color: Colors.grey, fontSize: 16),),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: const Text('Créer un compte', style: TextStyle(color: ThemeColor.primaryBlack, fontSize: 16, fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Get.toNamed(Routes.REGISTER);
                    },
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
