import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login/widgets/auth_header.dart';
import '../controllers/register_controller.dart';
import '../widgets/company_dropdown_field.dart';
import '../widgets/email_input_field.dart';
import '../widgets/login_link.dart';
import '../widgets/name_input_field.dart';
import '../widgets/password_input_field.dart';
import '../widgets/register.button.dart';


class RegisterView extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    title: "Register",
                    subtitle: "Buat akun dahulu yuks!!!",
                  ),
                  const SizedBox(height: 30),
                  NameInputField(),
                  const SizedBox(height: 20),
                  EmailInputField(),
                  const SizedBox(height: 20),
                  CompanyDropdownField(),
                  const SizedBox(height: 20),
                  PasswordInputField(),
                  const SizedBox(height: 30),
                  RegisterButton(formKey: _formKey),
                  const SizedBox(height: 20),
                  LoginLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
