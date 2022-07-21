import 'package:flutter/material.dart';
import 'package:task_app/feature/screens/regester/regester_screen.dart';

import '../../../commons/grandient_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
