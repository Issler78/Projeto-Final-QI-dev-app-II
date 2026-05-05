import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/botao_voltar.dart';
import 'package:pulsetime/widgets/form_cad1.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // suporte para AppBar, body, etc
      resizeToAvoidBottomInset: false, // evitar que o teclado redimensione a tela
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // 100%
          decoration: BoxDecoration( // para estilizar
            color: Colors.white,
          ),
          child: Column(
            children: [

              // parte de cima do app
              Stack(
                children: [
                  // logo com gradiente no fundo
                  PaginaTopo(),
                  BotaoVoltar(),
                ],
              ),


              Container(
                padding: EdgeInsets.only(left: 35, right: 35),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Antes de tudo,",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 650),
                      ),
                      Text(
                        "precisamos conhecer",
                        style: TextStyle(
                          color: Color.fromRGBO(11, 180, 255, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )
                      ).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 650),
                      ),
                      Text(
                        "um pouco mais você...",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 147, 22, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 650),
                      ),



                      SizedBox(height: 10),



                      // subtitulo
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 650
                        ),
                        child: Text(
                          "Preencha seus dados com atenção. Isso nos ajuda a oferecer a melhor experiência para você.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(94, 94, 94, 1),
                            fontSize: 18,
                            height: 1.2,
                          ),
                        ),
                      ).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 900),
                      ),


                      SizedBox(height: 25),

                      
                      // form
                      FormCad1()

                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
