import 'package:flutter/material.dart';
import 'package:task_app/feature/widgets/cuver_widget.dart';


import 'regester_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xff6a515e)),
      ),
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xfff2cbd0),
                Color(0xfff4ced9),
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
                    'Register',
                    style: TextStyle(fontSize: 40, color: Color(0xff6a515e)),
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 230),
                  child: RegisterForm(),
                ),
              ),
            ]),
          )),
    );
  }
}
