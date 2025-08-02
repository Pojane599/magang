import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/validator.dart';
import '../controllers/register_controller.dart';

class EmailInputField extends GetView<RegisterController> {
  const EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller.emailController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email, color: Colors.deepOrange),
            border: OutlineInputBorder(),
          ),
          validator: (value) => Validator.validateEmail(value ?? ''),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
