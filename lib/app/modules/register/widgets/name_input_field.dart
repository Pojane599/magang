import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/validator.dart';
import '../controllers/register_controller.dart';

class NameInputField extends GetView<RegisterController> {
  const NameInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nama",
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
          validator: (value) => Validator.validateName(value ?? ''),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}