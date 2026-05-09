import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_tipo_consulta.dart';
import 'package:pulsetime/widgets/buttons/botao_voltar.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';
import 'package:pulsetime/widgets/profissional.dart';

class TipoConsulta extends StatelessWidget {
  const TipoConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ), // 100%
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
                        "Que tipo",
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
                        "de consulta",
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
                        "você precisa?",
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
                          "Escolha a especialidade desejada para ver os profissionais disponíveis.",
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

                      SizedBox(height: 30,),

                      // FAZER UMA LIST VIEW NO FUTURO PARA CADA PROFISSAO PRESENTE RECEBIDA DO BACK END
                      BotaoTipoConsulta(tipo: "Nutricionista").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Pediatra").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Clínico Geral").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Psicólogo").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Dentista").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Dermatologista").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Oftalmologista").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Fisioterapeuta").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 10,),

                      BotaoTipoConsulta(tipo: "Ginecologista").animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1000),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 30,),
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




class EscolherProfissional extends StatefulWidget {
  final String profissao;

  const EscolherProfissional({super.key, required this.profissao});

  @override
  State<StatefulWidget> createState() => _EscolherProfissionalState();

}

class _EscolherProfissionalState extends State<EscolherProfissional> {

  late List<Map<String, dynamic>> profissionais;

  @override
  void initState() {
    super.initState();
    _buscarProfissionais(widget.profissao);
  }

  Future<void> _buscarProfissionais(String profissao) async {
    // IMPLEMENTAR A BUSCA DOS PROFISSIONAIS DA PROFISSAO SELECIONADA
    final profissionaisBuscados = [
      {
        "id": 1,
        "nome": "Marcos Lima",
        "cod": "0123456789/2024",
        "loc": "Clínica 1",
        "preco": Decimal.parse("150.00")
      },
      {
        "id": 2,
        "nome": "Marcos Lima",
        "cod": "0123456789/2024",
        "loc": "Clínica 1",
        "preco": Decimal.parse("150.00")
      },
      {
        "id": 3,
        "nome": "Marcos Lima",
        "cod": "0123456789/2024",
        "loc": "Clínica 1",
        "preco": Decimal.parse("150.00")
      },
      {
        "id": 4,
        "nome": "Marcos Lima",
        "cod": "0123456789/2024",
        "loc": "Clínica 1",
        "preco": Decimal.parse("150.00")
      },
      {
        "id": 5,
        "nome": "Marcos Lima",
        "cod": "0123456789/2024",
        "loc": "Clínica 1",
        "preco": Decimal.parse("150.00")
      },
    ];

    setState(() {
      profissionais = profissionaisBuscados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ), // 100%
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Escolha um ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "profissional.",
                              style: TextStyle(
                                color: Color.fromRGBO(11, 180, 255, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                          "Confira os profissionais disponíveis, locais de atendimento e horários.",
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

                      SizedBox(height: 30,),

                      // profissionais
                      ListView.builder(
                        itemCount: profissionais.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          // para cada profissional
                          return ProfissionalWidget(
                            id: profissionais[index]['id'],
                            profissao: widget.profissao, 
                            nome: profissionais[index]['nome'], 
                            cod: profissionais[index]['cod'], 
                            loc: profissionais[index]['loc'], 
                            preco: profissionais[index]['preco'],
                          ).animate()
                          .slideY(
                            duration: Duration(milliseconds: 900),
                            begin: -0.5,
                            curve: Curves.easeOut,
                            delay: Duration(milliseconds: 950),
                          )
                          .fadeIn(duration: Duration(milliseconds: 1500));
                        },
                      ),

                      SizedBox(height: 30),
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



// tela de escolha do dia da consulta
class EscolherDia extends StatefulWidget {
  final int id;
  final String nome;
  final String loc;
  final String profissao;
  final Decimal preco;

  const EscolherDia({super.key, required this.profissao, required this.id, required this.nome, required this.loc, required this.preco});

  @override
  State<StatefulWidget> createState() => _EscolherDiaState();

}


class _EscolherDiaState extends State<EscolherDia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ), // 100%
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Escolha a ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "data e",
                              style: TextStyle(
                                color: Color.fromRGBO(11, 180, 255, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 650),
                      ),

                      Text(
                        "um horário.",
                        style: TextStyle(
                        color: Color.fromRGBO(0, 147, 22, 1),
                        fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 700),
                      ),


                      SizedBox(height: 10),



                      // card com o profissional escolhido
                      ProfissionalWidget2(
                        id: widget.id,
                        nome: widget.nome,
                        loc: widget.loc,
                        preco: widget.preco,
                        profissao: widget.profissao,
                      ).animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 800),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),



                      // "input" de escolha de data


                      SizedBox(height: 30),
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