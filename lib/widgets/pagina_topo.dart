import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PaginaTopo extends StatelessWidget {
  final double height;

  const PaginaTopo({this.height = 160, super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(52, 245, 145, 1),
            Color.fromRGBO(84, 127, 255, 1),
            Color.fromRGBO(255, 255, 255, 1),
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Image.asset('assets/images/logo.png')
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
    );
  }
}
