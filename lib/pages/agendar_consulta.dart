import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_continuar.dart';
import 'package:pulsetime/widgets/buttons/botao_tipo_consulta.dart';
import 'package:pulsetime/widgets/buttons/botao_voltar.dart';
import 'package:pulsetime/widgets/inputs/calendario.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';
import 'package:pulsetime/widgets/profissional.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TipoConsulta extends StatelessWidget {
  const TipoConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    // especialidades disponiveis
      List<Map<String, String>> especialidades = [
        {
          "profissao": "Nutricionista",
          "imagem": "nutri.png"
        },
        {
          "profissao": "Pediatra",
          "imagem": "pediatra.png"
        },
        {
          "profissao": "Clínico Geral",
          "imagem": "clinicogeral.png"
        },
        {
          "profissao": "Psicólogo",
          "imagem": "psicologo.png"
        },
        {
          "profissao": "Dentista",
          "imagem": "dentista.png"
        },
        {
          "profissao": "Dermatologista",
          "imagem": "dermato.png"
        },
        {
          "profissao": "Oftalmologista",
          "imagem": "oftalmo.png"
        },
        {
          "profissao": "Fisioterapeuta",
          "imagem": "fisio.png"
        },
        {
          "profissao": "Ginecologista",
          "imagem": "gineco.png"
        },
      ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ), // 100%
          decoration: BoxDecoration(
            // para estilizar
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
                        ),
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
                        constraints: BoxConstraints(maxWidth: 650),
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

                      SizedBox(height: 30),


                      // list view com cada especialidade disponivel
                      ListView.builder(
                        itemCount: especialidades.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final especialidade = especialidades[index];

                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: BotaoTipoConsulta(tipo: especialidade["profissao"]!, imagem: especialidade["imagem"]!,),
                          ).animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.5,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 1000 + ((index + 1) * 15)),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1500));
                        }
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
        "cod": "13323/2024",
        "loc": "Amor Saúde",
        "preco": Decimal.parse("150.00"),
        "imagem": "doctor1.jpg"
      },
      {
        "id": 2,
        "nome": "Fernando Santos",
        "cod": "33234/2018",
        "loc": "Sáude Para Todos",
        "preco": Decimal.parse("120.00"),
        "imagem": "doctor2.jpg"
      },
      {
        "id": 3,
        "nome": "Amanda Ribeiro",
        "cod": "52353/2019",
        "loc": "Bem Viver",
        "preco": Decimal.parse("180.00"),
        "imagem": "doctor3.jpg"
      },
      {
        "id": 4,
        "nome": "Sofia Oliveira",
        "cod": "44345/2025",
        "loc": "SoluMedi",
        "preco": Decimal.parse("130.00"),
        "imagem": "doctor4.jpg"
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
          decoration: BoxDecoration(
            // para estilizar
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 700),
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
                      alignment: AlignmentGeometry.centerLeft,
                      constraints: BoxConstraints(maxWidth: 650),
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

                    SizedBox(height: 30),

                    // profissionais
                    ListView.builder(
                      itemCount: profissionais.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // para cada profissional
                        return ProfissionalWidget(
                          id: profissionais[index]["id"],
                          profissao: widget.profissao,
                          nome: profissionais[index]["nome"],
                          cod: profissionais[index]["cod"],
                          loc: profissionais[index]["loc"],
                          preco: profissionais[index]["preco"],
                          imagem: profissionais[index]["imagem"],
                        )
                        .animate()
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
            ],
          ),
        ),
      ),
    );
  }
}

// tela de escolha do dia da consulta
class EscolherDia extends StatefulWidget {
  final int id;
  final String nome;
  final String cod;
  final String loc;
  final String profissao;
  final Decimal preco;
  final String imagem;

  const EscolherDia({
    super.key,
    required this.profissao,
    required this.imagem,
    required this.id,
    required this.nome,
    required this.loc,
    required this.preco, 
    required this.cod,
  });

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
          decoration: BoxDecoration(
            // para estilizar
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
                padding: EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        imagem: widget.imagem,
                        nome: widget.nome,
                        loc: widget.loc,
                        preco: widget.preco,
                        profissao: widget.profissao,
                      )
                      .animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 800),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 15),



                      // legenda
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 147, 22, 1),
                            ),
                          ),

                          Text(
                            "Dias disponíveis",
                            style: TextStyle(
                              color: Color.fromRGBO(94, 94, 94, 1),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ).animate()
                      .slideY(
                        duration: Duration(milliseconds: 1100),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 800),
                      )
                      .fadeIn(duration: Duration(milliseconds: 850)),
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(11, 180, 255, 1),
                            ),
                          ),

                          Text(
                            "Data selecionada",
                            style: TextStyle(
                              color: Color.fromRGBO(94, 94, 94, 1),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ).animate()
                      .slideY(
                        duration: Duration(milliseconds: 1100),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 800),
                      )
                      .fadeIn(duration: Duration(milliseconds: 850)),



                      SizedBox(height: 5),



                      // "input" de escolha de data e horario
                      CalendarioEHorariosWidget(
                        profissionalId: widget.id,
                        nome: widget.nome,
                        cod: widget.cod,
                        loc: widget.loc,
                        preco: widget.preco,
                        profissao: widget.profissao,
                        imagem: widget.imagem,
                      ).animate()
                      .slideY(
                        duration: Duration(milliseconds: 1100),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 800),
                      )
                      .fadeIn(duration: Duration(milliseconds: 900)),
                      

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// tela de resumo e confirmação da consulta

class ResumoConsultaPage extends StatefulWidget {
  final int profissionalId;
  final String nome;
  final String profissao;
  final String cod;
  final String loc;
  final Decimal preco;
  final DateTime dataHorario;
  final String imagem;

  const ResumoConsultaPage({super.key, required this.profissionalId, required this.nome, required this.profissao, required this.loc, required this.preco, required this.dataHorario, required this.cod, required this.imagem});

  @override
  State<StatefulWidget> createState() => ResumoConsultaState();
}

class ResumoConsultaState extends State<ResumoConsultaPage> {

  // meses
  static List<String> meses = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro",
  ];

  static List<String> diasSemana = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"];

  Future<void> _salvarConsulta() async {
    final Map<String, dynamic> novaConsulta = {
      "nome_profissional": widget.nome,
      "profissao": widget.profissao,
      "cod": widget.cod,
      "loc": widget.loc,
      "preco": widget.preco.toStringAsFixed(2),
      "data_e_horario": widget.dataHorario.toString(),
      "imagem": widget.imagem
    };



    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // verificar se ja existe consultas salvas
    final String? consultas = prefs.getString("minhas_consultas");

    // se nao existe consultas salvas
    if(consultas == null){

      // transformando a nova consulta em uma string json
      final jsonString = jsonEncode([novaConsulta]); 
      prefs.setString("minhas_consultas", jsonString); // salvando

    } else {

      // transforma o json/string encontrada em uma lista
      final List<dynamic> listaExistente = jsonDecode(consultas);
      listaExistente.add(novaConsulta); // adicionando nova consulta na lista
      prefs.setString("minhas_consultas", jsonEncode(listaExistente)); // salvando

    }
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
          decoration: BoxDecoration(
            // para estilizar
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
                padding: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Confira os ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "detalhes",
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
                        "da sua consulta.",
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


                      // subtitulo
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 650
                        ),
                        child: Text(
                          "Revise as informações antes de confirmar.",
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

                      SizedBox(height: 20,),



                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        constraints: BoxConstraints(maxWidth: 700),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: BoxBorder.all(
                            color: Color.fromRGBO(79, 97, 162, .15),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            
                            // profissional
                            Row(
                              children: [

                                // foto perfil
                                Container(
                                  width: 65,
                                  height: 65,
                                  margin: EdgeInsets.only(right: 15),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusGeometry.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/${widget.imagem}",
                                    width: 65,
                                    height: 65,
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // textos
                                    Text(
                                      "Profissional",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                        fontSize: 14,
                                      ),
                                    ),

                                    SizedBox(height: 10,),

                                    Text(
                                      widget.nome,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      ),
                                    ),
                                    Text(
                                      widget.profissao,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(11, 180, 255, 1),
                                        fontSize: 14,
                                        height: 1.1,
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                            .animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.5,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 1000),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1500)),


                            SizedBox(height: 15,),


                            // local
                            Row(
                              children: [
                                // icone
                                Container(
                                  width: 65,
                                  height: 65,
                                  margin: EdgeInsets.only(right: 15),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(79, 97, 162, .15),
                                    borderRadius: BorderRadiusGeometry.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/loc.png",
                                    width: 65,
                                    height: 65,
                                  ),
                                ),

                                // textos
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "Local",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      widget.loc,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                            .animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.5,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 1100),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1500)),
                          

                            SizedBox(height: 15,),


                            // data
                            Row(
                              children: [

                                // icone
                                Container(
                                  width: 65,
                                  height: 65,
                                  margin: EdgeInsets.only(right: 15),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(79, 97, 162, .15),
                                    borderRadius: BorderRadiusGeometry.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/calendar-249.png",
                                    width: 65,
                                    height: 65,
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // textos
                                    Text(
                                      "Data",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                        fontSize: 14,
                                      ),
                                    ),

                                    SizedBox(height: 10,),

                                    Text(
                                      "${widget.dataHorario.day} de ${meses[widget.dataHorario.month]} de ${widget.dataHorario.year}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      diasSemana[widget.dataHorario.weekday - 1],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                        fontSize: 14,
                                        height: 1.1,
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                            .animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.5,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 1200),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1500)),


                            SizedBox(height: 15,),


                            // horario
                            Row(
                              children: [

                                // icone
                                Container(
                                  width: 65,
                                  height: 65,
                                  margin: EdgeInsets.only(right: 15),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(79, 97, 162, .15),
                                    borderRadius: BorderRadiusGeometry.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/clockpng.png",
                                    width: 65,
                                    height: 65,
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // textos
                                    Text(
                                      "Horário",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                        fontSize: 14,
                                        height: 1.1
                                      ),
                                    ),

                                    SizedBox(height: 5,),

                                    Text(
                                      "${widget.dataHorario.hour.toString().padLeft(2, "0")}:00",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1
                                      ),
                                    ),

                                  ],
                                )

                              ],
                            )
                            .animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.5,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 1300),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1500)),


                            SizedBox(height: 15,),


                            // preco
                            Row(
                              children: [

                                // icone
                                Container(
                                  width: 65,
                                  height: 65,
                                  margin: EdgeInsets.only(right: 15),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(79, 97, 162, .15),
                                    borderRadius: BorderRadiusGeometry.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/coins.png",
                                    width: 65,
                                    height: 65,
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // textos
                                    Text(
                                      "Valor",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                        fontSize: 14,
                                        height: 1.1
                                      ),
                                    ),

                                    SizedBox(height: 5,),

                                    Text(
                                      "R\$ ${widget.preco.toStringAsFixed(2)}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 147, 22, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1
                                      ),
                                    ),

                                  ],
                                )

                              ],
                            )
                            .animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.5,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 1400),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1500)),
                          ],
                        ),
                      )
                      .animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 950),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),
 


                      SizedBox(height: 10,),
                      
                      // politica de cancelamento aviso
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        constraints: BoxConstraints(maxWidth: 700),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: BoxBorder.all(
                            color: Color.fromRGBO(79, 97, 162, .15),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            //icone
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 15),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                color: Color.fromRGBO(79, 97, 162, .15),
                              ),
                              child: Image.asset(
                                "assets/images/pol.png",
                                width: 40,
                                height: 40,
                              ),
                            ),

                            // textos
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // textos
                                  Text(
                                    "Política de cancelamento",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                    ),
                                  ),

                                  Text(
                                    "Cancelamentos podem ser feitos com até 24h de antecedência sem cobrança.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                      fontSize: 12,
                                      height: 1,
                                    ),
                                  ),

                                ]
                              )
                            )
                          ]
                        )
                      )
                      .animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1450),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 30,),

                      // botao de confirmar
                      BotaoContinuar(comIcone: false, texto: "Confirmar consulta", funcao: () {
                        
                        // funcao para salvar na "memoria"
                        _salvarConsulta(
                          
                        );

                        Navigator.pushNamed(context, "/");

                      })
                      .animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.5,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 1500),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1500)),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}