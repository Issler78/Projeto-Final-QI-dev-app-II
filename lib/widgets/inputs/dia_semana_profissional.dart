import 'package:flutter/material.dart';

class DiaSemanaProfissional extends StatelessWidget {
  final String label;
  final Color corFundo;
  final Color corBorda;
  final VoidCallback onTap;

  const DiaSemanaProfissional({super.key, required this.label, required this.corFundo, required this.corBorda, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: corFundo,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: BoxBorder.all(
            color: corBorda,
            width: 1.5,
          )
        ),
        constraints: BoxConstraints(
          maxWidth: 90
        ),
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          )
        )
      ),
    );
  }

  
}