import 'package:flutter/material.dart';

class BotaoPerfil extends StatelessWidget {
  final String icone;
  final String textoPerfil;
  final String subtexto;
  final VoidCallback funcao;

  const BotaoPerfil({ super.key, required this.icone, required this.textoPerfil, required this.subtexto, required this.funcao, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // decorando o botao
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      height: 140,
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 700
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          // deixando o "botao" transparente para utilizar o background do container
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            ),
          ),
        ),
        onPressed: funcao,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // icone
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(79, 97, 162, .15)
              ),
              child: Image.asset(
                icone,
                width: 80,
                height: 80,
              ),
            ),

            // texto
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text(
                    textoPerfil,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    subtexto,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromRGBO(94, 94, 94, 1),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
              
          ],
        )
      ),
    );
  }
  
}