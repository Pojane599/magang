import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/validator.dart';
import '../controllers/login_controller.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              // 👈 bungkus pakai Form
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    title: "Masuk",
                    subtitle:
                        "Silahkan masukan email dan kata sandi yang sudah dibuat",
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    controller: controller.emailController,
                    prefixIcon: Icons.email,
                    validator: (value) => Validator.validateEmail(value ?? ""),
                  ),
                  const SizedBox(height: 25),

                  const Text(
                    "Kata Sandi",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController,
                      prefixIcon: Icons.lock,
                      obscureText: controller.isPasswordHidden.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.deepOrange,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      validator:
                          (value) => Validator.validatePassword(value ?? ""),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Tombol Login
                  Obx(
                    () => LoginButton(
                      text: "Masuk",
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.login(); // hanya jalan kalau valid
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Link ke register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Belum punya akun? "),
                      GestureDetector(
                        onTap: () => Get.toNamed('/register'),
                        child: const Text(
                          "Buat akun",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
