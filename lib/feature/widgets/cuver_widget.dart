// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CurvedWidget extends StatelessWidget {
  const CurvedWidget({
    Key? key,
    required this.child,
    this.curvedDistance = 80,
    this.curvedHeight = 80,
  }) : super(key: key);
  final Widget child;
  final double curvedDistance;
  final double curvedHeight;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedWidgetBackgroundCliper(
          curvedDistance: curvedDistance, curvedHeight: curvedHeight),
      child: Container(),
    );
  }
}

class CurvedWidgetBackgroundCliper extends CustomClipper<Path> {
  final double curvedDistance;
  final double curvedHeight;

  CurvedWidgetBackgroundCliper({
    required this.curvedDistance,
    required this.curvedHeight,
  });

  @override
  getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.lineTo(size.width, 0);
    clippedPath.lineTo(size.width, size.height - curvedDistance - curvedHeight);
    clippedPath.quadraticBezierTo(size.width, size.height - curvedHeight,
        size.width - curvedDistance, size.height - curvedHeight);
    clippedPath.lineTo(curvedDistance, size.height - curvedHeight);
    clippedPath.quadraticBezierTo(
        0, size.height - curvedHeight, 0, size.height);
    clippedPath.lineTo(0, 0);

    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
