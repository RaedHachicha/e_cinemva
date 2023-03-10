import 'package:e_cinemav1/consts/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class RegisterFormWidget extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  RegisterFormWidget(
      {Key? key,
      required this.formKey,
      required this.usernameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController})
      : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final usernameValidator =
      ValidationBuilder().required().minLength(3).maxLength(10).build();
  final phoneValidator = ValidationBuilder().required().phone().build();
  final emailValidator = ValidationBuilder().required().email().build();
  final passwordValidator =
      ValidationBuilder().required().minLength(8).maxLength(20).build();
  final confirmPasswordValidator =
      ValidationBuilder().required().minLength(8).maxLength(20).build();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
              hintText: "Username",
              validator: usernameValidator,
              fieldController: widget.usernameController),
          CustomTextField(
              hintText: "Phone Number (+33)",
              validator: phoneValidator,
              fieldController: widget.phoneController),
          CustomTextField(
              hintText: "Email",
              validator: emailValidator,
              fieldController: widget.emailController),
          CustomTextField(
              hintText: "Password",
              validator: passwordValidator,
              fieldController: widget.passwordController),
          CustomTextField(
              hintText: "Confirm Password",
              validator: confirmPasswordValidator,
              fieldController: widget.confirmPasswordController),
            
        ],
      ),
    );
  }
}
