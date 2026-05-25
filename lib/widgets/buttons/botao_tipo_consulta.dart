import 'package:flutter/material.dart';
import 'package:pulsetime/pages/agendar_consulta.dart';

class BotaoTipoConsulta extends StatelessWidget {
  final String tipo;
  final String imagem;

  const BotaoTipoConsulta({ super.key, required this.tipo, required this.imagem });

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
      height: 95,
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
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => EscolherProfissional(profissao: tipo)
            )
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // icone
            Container(
              width: 75,
              height: 75,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(79, 97, 162, .15)
              ),
              child: Image.asset(
                // talvez mudar no futuro para cada uma
                "assets/images/$imagem",
                width: 75,
                height: 75,
              ),
            ),

            // texto
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tipo,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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