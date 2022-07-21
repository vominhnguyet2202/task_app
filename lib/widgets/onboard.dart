import 'package:flutter/material.dart';
import 'package:task_app/feature/screens/tab_screens/tab_screen.dart';

import '../feature/screens/login_screen.dart';
import '../services/setting/sizeconfig.dart';

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
                        Color(0xffd1eded),
                        Color(0xff9deded),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.blueGrey,
                  minimumSize: const Size(280, 40),
                  textStyle: TextStyle(fontSize: getsizeWidth(20)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TabScreen()));
                },
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
