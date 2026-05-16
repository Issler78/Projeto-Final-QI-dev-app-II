import 'package:flutter/material.dart';

class MensagemErro extends StatelessWidget {
  final String mensagem;

  const MensagemErro({super.key, required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(200, 0, 0, .07),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(200, 0, 0, .35), width: 1.2),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            size: 16,
            color: Color.fromRGBO(200, 0, 0, 1),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Text(
              mensagem,
              style: TextStyle(color: Color.fromRGBO(200, 0, 0, 1), fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
