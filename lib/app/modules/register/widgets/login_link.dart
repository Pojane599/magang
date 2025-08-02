import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Sudah punya akun? '),
        GestureDetector(
          onTap: () => Get.offAllNamed('/login'),
          child: const Text(
            'Masuk',
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
      ],
    );
  }
}