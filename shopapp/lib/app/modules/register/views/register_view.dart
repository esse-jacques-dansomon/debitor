import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/app/themes/theme_colors.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset("assets/lotties/login.json"),
              ),
            ),
            const Text("Créer un compte", style: TextStyle(fontSize: 30)),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Obx(() {
                      return Container(
                        width: 100,
                        height: 100,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey[200],
                          image: controller.file.value != null
                              ? DecorationImage(
                                  image: FileImage(controller.file.value!),
                                  fit: BoxFit.cover,
                                )
                              : null, // Show selected image if available
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: controller.file.value == null
                                ? Colors.blue
                                : Colors.grey[300],
                            // Change color based on image presence
                            size: 35,
                          ),
                          onPressed: () {
                            controller
                                .pickImage(); // Open gallery to pick an image
                          },
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        suffixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: ThemeColor.primaryBlue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
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
                    const SizedBox(
                      height: 20,
                    ),

                    Obx(
                      () => TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.isConfirmPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isConfirmPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                controller.toggleConfirmPasswordVisibility,
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
                          } else if (value !=
                              controller.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // Bouton de Connexion
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.register();
                                  }
                                },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ThemeColor.primaryBlue),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Créer un compte',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ],
                )),

            TextButton(
              onPressed: (){
                Get.toNamed(Routes.LOGIN);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vous avez déjà un compte?', style: TextStyle(color: Colors.grey, fontSize: 12),),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Se connecter', style: TextStyle(color: ThemeColor.primaryBlack, fontSize: 12, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
