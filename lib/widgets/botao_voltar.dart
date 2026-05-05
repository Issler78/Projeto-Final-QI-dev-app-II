import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BotaoVoltar extends StatelessWidget{
  const BotaoVoltar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(50),
        ),
        width: 44,
        height: 44,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            iconAlignment: IconAlignment.start,
            shadowColor: WidgetStateProperty.all(Colors.transparent),
          ),
          icon: Image.asset(
            "assets/images/back.png",
            width: 28,
            height: 26,
          ),
        )
      )
    )
    .animate()
    .slideY(
      duration: Duration(milliseconds: 900),
      begin: -0.5,
      curve: Curves.easeOut,
    )
    .fadeIn(duration: Duration(milliseconds: 1500));
  }
}