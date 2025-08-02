import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/validator.dart';
import '../../../data/providers/api_provider.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var selectedCompanyId = 0.obs;
  var isPasswordHidden = true.obs;

  var companies = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  final ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> fetchCompanies() async {
    try {
      final result = await apiProvider.getTenantCompanies();
      companies.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void register() async {
    final nameError = Validator.validateName(nameController.text.trim());
    final emailError = Validator.validateEmail(emailController.text.trim());
    final passwordError = Validator.validatePassword(
      passwordController.text.trim(),
    );

    if (nameError != null) {
      Get.snackbar("Error", nameError);
      return;
    }
    if (emailError != null) {
      Get.snackbar("Error", emailError);
      return;
    }
    if (passwordError != null) {
      Get.snackbar("Error", passwordError);
      return;
    }
    if (selectedCompanyId.value == 0) {
      Get.snackbar("Error", "Pilih perusahaan terlebih dahulu");
      return;
    }

    isLoading.value = true;
    try {
      final response = await apiProvider.register(
        name: nameController.text,
        email: emailController.text,
        tenantCompanyId: selectedCompanyId.value,
        password: passwordController.text,
      );

      if (response.data["message"] != null) {
        Get.snackbar("Sukses", "Registrasi berhasil");
        Get.offAllNamed('/login');
      } else {
        Get.snackbar("Gagal", response.data["message"] ?? "Gagal daftar");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
