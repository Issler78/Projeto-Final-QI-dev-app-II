import 'package:flutter/material.dart';

class BotaoContinuar extends StatelessWidget {
  final bool comIcone;
  final String texto;
  final VoidCallback funcao;

  const BotaoContinuar({
    super.key,
    required this.comIcone,
    required this.texto,
    required this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // decorando o botao
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(77, 255, 98, 1),
            Color.fromRGBO(84, 127, 255, 1),
          ],
          begin: AlignmentGeometry.centerStart,
          end: AlignmentGeometry.centerEnd,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: List.of([
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ]),
      ),
      height: 60,
      width: double.infinity,
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
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            // força o stack ter 100% do tamanho do container do botao
            SizedBox(width: double.infinity),
            // texto do botao
            Text(
              texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),

            // icone
            if(comIcone)
              Positioned(
                right: 0,
                child: Transform.flip(
                  flipX: true,
                  child: Image.asset(
                    "assets/images/back-white.png",
                    width: 28,
                    height: 25,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
