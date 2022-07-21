// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../services/sizeconfig.dart';
import '../widgets/onboard.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingPage(
                        image: demo_data[index].image,
                        title: demo_data[index].title,
                        description: demo_data[index].description,
                      )),
            ),
            Row(
              children: [
                ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DoIndicator(
                            isActive: index == _pageIndex,
                          ),
                        )),
                const Spacer(),
                SizedBox(
                  height: getsizeHeight(55),
                  width: getsizeWidth(55),
                  child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.white,
                      )),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class DoIndicator extends StatelessWidget {
  const DoIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 12 : 6,
      width: 8,
      decoration: const BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, description;
  Onboard({
    required this.description,
    required this.image,
    required this.title,
  });
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [
  Onboard(
      image: "assets/images/onboa2.png",
      title: "WELLCOME TO TASK APP",
      description:
          "Manage, capture and edit to-dos anytime, \nanywhere with to-do lists"),
  Onboard(
      image: "assets/images/onboa1.png",
      title: "CONVENIENT APPLICATION \nAND EASY TO USE ",
      description: " abc adewljfs eagjeisogjn "),
];
