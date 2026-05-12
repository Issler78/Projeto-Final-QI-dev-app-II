import 'package:flutter/material.dart';
 
class LinhaPaciente extends StatelessWidget {
  final int id;
  final String nome;
  final String horario;
  final VoidCallback onExcluir;
 
  const LinhaPaciente({
    super.key,
    required this.id,
    required this.nome,
    required this.horario,
    required this.onExcluir,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusGeometry.circular(10),
        border: BoxBorder.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          // horario da consulta
          Container(
            width: 52,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromRGBO(11, 180, 255, .1),
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            child: Center(
              child: Text(
                horario,
                style: TextStyle(
                  color: Color.fromRGBO(11, 180, 255, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
 
          SizedBox(width: 12),
 
          // nome do paciente
          Expanded(
            child: Text(
              nome,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
 
 
 
          // botao de excluir
          GestureDetector(
            onTap: onExcluir,
            child: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(200, 0, 0, .07),
                borderRadius: BorderRadiusGeometry.circular(8),
                border: BoxBorder.all(
                  color: Color.fromRGBO(200, 0, 0, .3),
                  width: 1.2,
                ),
              ),
              child: Icon(
                Icons.delete_outline,
                color: Color.fromRGBO(200, 0, 0, 1),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}