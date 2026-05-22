import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectInput extends StatefulWidget {
  final String icone;
  final String ?placeholder;
  final List<String> items;
  final String ?value;
  final void Function(String ?valor) funcao;
  final double fontSize;

  const SelectInput({ super.key, required this.icone, this.placeholder, required this.items, required this.value, required this.funcao, this.fontSize = 20 });
  
  @override
  State<StatefulWidget> createState() => _SelectInputState();
  
} 

class _SelectInputState extends State<SelectInput> {

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
              widget.icone,
              width: 36,
              height: 36,
            ),
          ),

          // input
          Expanded(
            child: DropdownButton(
              // faz um map com a lista de items, retorna um DropdownMenuItem para cada um, com seu valor (que será enviado ao banco de dados) e com o proprio item como widget
              items: widget.items.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: widget.funcao,
              isExpanded: true,
              value: widget.value,
              underline: SizedBox(),
              style: GoogleFonts.inter(
                color: Color.fromRGBO(94, 94, 94, 1),
                fontSize: widget.fontSize,
              ),
              hint: widget.placeholder != null ? 
                Text(
                  widget.placeholder!,
                  style: GoogleFonts.inter(
                    color: Color.fromRGBO(94, 94, 94, 1),
                    fontSize: widget.fontSize,
                  ),
                )
                : Text(""),
              icon: RotatedBox( // rotacionar a imagem
                quarterTurns: 3,
                child: Image.asset(
                  "assets/images/back.png",
                  opacity: const AlwaysStoppedAnimation(.5),
                  width: 28,
                  height: 25,
                ),
              )
            ),
          )
        ],
      ),
    );
  }

}