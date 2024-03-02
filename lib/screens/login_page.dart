import 'package:flutter/material.dart';
import 'package:iparkpatrol_web/screens/home_screen.dart';
import 'package:iparkpatrol_web/utlis/colors.dart';
import 'package:iparkpatrol_web/widgets/button_widget.dart';
import 'package:iparkpatrol_web/widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(
                height: 75,
              ),
              TextFieldWidget(
                borderColor: primary,
                label: 'Admin ID Number',
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                isObscure: true,
                borderColor: primary,
                label: 'Password',
                controller: passwordController,
                showEye: true,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                radius: 10,
                color: primary,
                width: 175,
                label: 'Sign In',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
