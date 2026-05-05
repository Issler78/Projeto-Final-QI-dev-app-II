import 'package:flutter/material.dart';
import 'package:pulsetime/widgets/text_input.dart';

class FormCad1 extends StatefulWidget {
  const FormCad1({super.key});
  
  @override
  State<FormCad1> createState() {
    return _FormCad1State();
  }
}

class _FormCad1State extends State<FormCad1>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 800
      ),
      child: Column(
        children: [
          // campos
          
          // campo de nome
          TextInput(icon: "assets/images/Sample_User_Icon.png", placeholder: "Nome completo"),
          SizedBox(height: 10,),
          
          // campo de e-mail
          TextInput(icon: "assets/images/email.webp", placeholder: "E-mail"),
        ],
      ),
    );
  }
}