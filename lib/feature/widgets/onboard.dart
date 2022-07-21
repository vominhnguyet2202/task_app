import 'package:flutter/material.dart';

import '../../services/setting/sizeconfig.dart';
import '../screens/login/login_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF99FFCC),
                        Color(0xFF33CCCC),
                        Color(0xFF0099FF),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: TextStyle(fontSize: getsizeWidth(20)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
