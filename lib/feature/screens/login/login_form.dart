import 'package:flutter/material.dart';
import 'package:task_app/feature/screens/login/commons/grandient_button_login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email), labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.always,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock), labelText: "Password"),
              obscureText: true,
              autovalidateMode: AutovalidateMode.always,
            ),
            const SizedBox(
              height: 10,
            ),
            GrandientButton(
              width: 150,
              height: 45,
              text: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.check),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            GrandientButton(
              width: 150,
              height: 45,
              text: const Text(
                'Regester',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
