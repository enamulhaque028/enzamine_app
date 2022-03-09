import 'package:aits_task/config/presentation/app_color.dart';
import 'package:aits_task/config/utils/auth_status.dart';
import 'package:aits_task/provider/registration_provider.dart';
import 'package:aits_task/screens/login/login_page.dart';
import 'package:aits_task/widgets/app_title.dart';
import 'package:aits_task/widgets/custom_button.dart';
import 'package:aits_task/widgets/custom_textfield.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.3,
                child: const Center(child: AppTitle()),
              ),
              Column(
                children: [
                  CustomTextField(
                    placeholderText: 'Name',
                    textEditingController: nameController,
                    icon: Icons.person_outline,
                  ),
                  CustomTextField(
                    placeholderText: 'Your Email',
                    textEditingController: emailController,
                    icon: Icons.email_outlined,
                  ),
                  CustomTextField(
                    placeholderText: 'Password',
                    textEditingController: passwordController,
                    icon: Icons.lock_outline_sharp,
                  ),
                  CustomTextField(
                    placeholderText: 'Confirm Password',
                    textEditingController: confirmPasswordController,
                    icon: Icons.lock_outline_sharp,
                  ),
                  const SizedBox(height: 12),
                  CustomTextButton(
                    title: 'SIGN UP',
                    onTapBtn: () async {
                      if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.warning,
                          text: 'Fill all the fields!',
                        );
                      } else {
                        if (passwordController.text != confirmPasswordController.text) {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.warning,
                            text: 'Password hasn\'t matched!',
                          );
                        } else {
                          await registrationProvider.registration(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                            context,
                          );
                          if (registrationProvider.status == AuthenticationStatus.authenticated) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: 'Registration Successful',
                            );
                          }
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
