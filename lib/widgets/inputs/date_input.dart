import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateInput extends StatefulWidget {
  final String icon;
  final String placeholder;
  final TextEditingController controller;

  const DateInput({ super.key, required this.icon, required this.placeholder, required this.controller });
  
  @override
  State<StatefulWidget> createState() => _DateInputState();
  
} 

class _DateInputState extends State<DateInput> {
  DateTime? dataSelecionada;

  Future<void> _selecionarData() async {
    // mostrar calendario na tela e esperar usuario escolher uma data
    final DateTime? data = await showDatePicker(
      context: context, 
      initialDate: dataSelecionada ?? DateTime.now(), // ou a data selecionada se tiver ou a data de hoje
      firstDate: DateTime(1900), 
      lastDate: DateTime.now(),
    );

    // alterar valor do input e mudar o estado da variavel
    if(data != null){
      final String dia = data.day.toString().padLeft(2, "0");
      final String mes = data.month.toString().padLeft(2, "0");
      final String ano = data.year.toString();

      setState(() {
        dataSelecionada = data;
        widget.controller.text = "$dia/$mes/$ano";
      });
    }
  }



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
              widget.icon,
              width: 36,
              height: 36,
            ),
          ),

          // input
          Expanded(
            child: TextField(
              onTap: () {
                _selecionarData();
              },
              controller: widget.controller,
              readOnly: true,
              enableInteractiveSelection: false,
              style: GoogleFonts.inter(
                fontSize: 20
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(0),
                hintText: widget.placeholder,
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