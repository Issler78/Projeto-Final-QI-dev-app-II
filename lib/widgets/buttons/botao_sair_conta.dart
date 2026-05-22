import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotaoSairConta extends StatelessWidget{
  const BotaoSairConta({super.key});

  Future<void> _sair() async {
    final prefs = await SharedPreferences.getInstance();
    
    prefs.setBool("logado", false);
    prefs.setBool("logadoPro", false);
  }

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
            _sair();

            // resetar a pagina
            Navigator.pushReplacementNamed(context, '/');
          }, 
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            iconAlignment: IconAlignment.start,
            shadowColor: WidgetStateProperty.all(Colors.transparent),
          ),
          icon: Icon(
            Icons.logout,
            size: 28,
          )
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