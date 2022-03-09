import 'package:aits_task/config/presentation/app_color.dart';
import 'package:aits_task/config/utils/auth_status.dart';
import 'package:aits_task/provider/login_provider.dart';
import 'package:aits_task/screens/home/home_page.dart';
import 'package:aits_task/widgets/app_title.dart';
import 'package:aits_task/widgets/custom_button.dart';
import 'package:aits_task/widgets/custom_textfield.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: height * 0.25,
                  child: const Center(child: AppTitle()),
                ),
                Column(
                  children: [
                    CustomTextField(
                      placeholderText: 'Your Email',
                      textEditingController: emailController,
                      icon: Icons.mail_outline,
                    ),
                    CustomTextField(
                      placeholderText: 'Password',
                      textEditingController: passwordController,
                      obscureText: true,
                      icon: Icons.lock_outline_sharp,
                    ),
                    const SizedBox(height: 12),
                    CustomTextButton(
                      title: 'LOGIN',
                      onTapBtn: () async {
                        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.warning,
                            text: 'Fill all the fields!',
                          );
                        } else {
                          await loginProvider.logIn(emailController.text, passwordController.text, context);
                          if (loginProvider.status == AuthenticationStatus.authenticated) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(color: AppColor.primaryTextColor, fontSize: 16),
                                ),
                                TextSpan(
                                  text: 'Signup',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
