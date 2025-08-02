import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/validator.dart';
import '../controllers/register_controller.dart';

class PasswordInputField extends GetView<RegisterController> {
  const PasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kata Sandi',
            style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller.passwordController,
            obscureText: controller.isPasswordHidden.value,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock, color: Colors.deepOrange),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.deepOrange,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            validator: (value) => Validator.validatePassword(value ?? ''),
          ),
        ],
      ),
    );
  }
}
