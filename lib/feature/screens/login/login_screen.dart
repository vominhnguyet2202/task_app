import 'package:flutter/material.dart';

import '../../widgets/cuver_widget.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
               Color(0xfff7d7d7),
                Color(0xfff4be8b),
              ])),
          child: SingleChildScrollView(
            child: Stack(children: <Widget>[
              CurvedWidget(
                child: Container(
                  padding: EdgeInsets.only(top: 100, left: 50),
                  height: double.infinity,
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.4)
                      ])),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 230),
                  child: LoginForm(),
                ),
              ),
            ]),
          )),
    );
  }
}
