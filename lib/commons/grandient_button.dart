// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GrandientButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Text text;
  final Icon icon;

  const GrandientButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xfff7dbc0),
            Color(0xffbcf4d7),
            // Color(0xffc0f7f9),
          ],
        ),
      ),
      child: MaterialButton(
          onPressed: onPressed,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[text, icon],
            ),
          )),
    );
  }
}
