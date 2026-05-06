import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  final String icon;
  final String placeholder;
  final TextInputType ?keyboardType;
  final TextInputFormatter ?mask;
  final TextEditingController controller;
  
  const TextInput({
    super.key, 
    required this.icon, 
    required this.placeholder, 
    this.keyboardType = TextInputType.text,  
    this.mask,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: BoxBorder.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // icone
          Container(
            width: 36,
            height: 36,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(79, 97, 162, .15)
            ),
            child: Image.asset(
              icon,
              width: 36,
              height: 36,
            ),
          ),

          // input
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: mask != null ? [mask!] : [], // verifica se mask é null, se nao for utiliza o mask recebido
              style: GoogleFonts.inter(
                fontSize: 20
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(0),
                hintText: placeholder,
                hintStyle: GoogleFonts.inter(
                  color: Color.fromRGBO(94, 94, 94, 1),
                  fontSize: 20,
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none)
              ),
            ),
          )
        ],
      ),
    );
  }
}