import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/validator.dart';
import '../../../data/providers/api_provider.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var loginAttempts = 0.obs;
  var isLocked = false.obs;
  DateTime? lockEndTime;

  final ApiProvider apiProvider = ApiProvider();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  bool validateInputs() {
    final emailError = Validator.validateEmail(emailController.text.trim());
    final passwordError = Validator.validatePassword(
      passwordController.text.trim(),
    );

    if (emailError != null) {
      Get.snackbar("Error", emailError);
      return false;
    }
    if (passwordError != null) {
      Get.snackbar("Error", passwordError);
      return false;
    }

    return true;
  }

  void login() async {
    if (isLocked.value) {
      final remaining = lockEndTime!.difference(DateTime.now()).inSeconds;
      Get.snackbar(
        "Terkunci",
        "Terlalu banyak percobaan gagal. Coba lagi dalam $remaining detik.",
      );
      return;
    }

    if (!validateInputs()) return;

    isLoading.value = true;

    try {
      final response = await apiProvider.login(
        emailController.text,
        passwordController.text,
      );

      if (response.statusCode == 200 && response.data["access_token"] != null) {
        // reset attempts setelah berhasil login
        loginAttempts.value = 0;

        Get.snackbar("Sukses", "Login berhasil");
        Get.offAllNamed('/home');
      } else {
        handleLoginFailure();
      }
    } catch (e) {
      handleLoginFailure();
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void handleLoginFailure() {
    loginAttempts.value++;

    if (loginAttempts.value >= 3) {
      isLocked.value = true;
      lockEndTime = DateTime.now().add(const Duration(seconds: 30));

      Get.snackbar(
        "Terkunci",
        "Anda gagal login 3 kali. Coba lagi setelah 30 detik.",
      );

      // auto unlock setelah 30 detik
      Future.delayed(const Duration(seconds: 30), () {
        loginAttempts.value = 0;
        isLocked.value = false;
      });
    } else {
      Get.snackbar("Gagal", "Login gagal. Percobaan ${loginAttempts.value}/3.");
    }
  }
}
