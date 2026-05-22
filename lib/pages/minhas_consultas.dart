import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_voltar.dart';
import 'package:pulsetime/widgets/card_consulta.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';
import 'package:shared_preferences/shared_preferences.dart';

// tela principal de listagem de consultas
class MinhasConsultas extends StatefulWidget {
  const MinhasConsultas({super.key});

  @override
  State<MinhasConsultas> createState() => _MinhasConsultasState();
}

class _MinhasConsultasState extends State<MinhasConsultas> {
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

  // dias da semana
  static List<String> diasSemana = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"];

  // consultas salvas
  List<Map<String, dynamic>>? consultasBuscadas;

  @override
  void initState() {
    super.initState();
    _minhasConsultas();
  }

  // funcao que retorna as consultas salvas
  Future<void> _minhasConsultas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? consultas = prefs.getString("minhas_consultas");

    setState(() {
      // se existe um json com consultas, transforma a string json em um objeto
      consultasBuscadas = consultas != null 
        ? List.from(jsonDecode(consultas)) 
        : null;
    });
  }

  // funcao de cancelar/remover a consulta
  Future<void> _cancelarConsulta(int consultaIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final String consultas = prefs.getString("minhas_consultas")!;

    // remover a consulta da lista de consultas pelo seu index
    final List<dynamic> listaConsultas = jsonDecode(consultas);
    listaConsultas.removeAt(consultaIndex);

    // salvar na "memoria" a nova lista sem a consulta removida
    prefs.setString("minhas_consultas", jsonEncode(listaConsultas));

    setState(() {
      consultasBuscadas = List.from(jsonDecode(consultas));
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
          ),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // parte de cima do app
              Stack(
                children: [
                  // logo com gradiente no fundo
                  PaginaTopo(),
                  BotaoVoltar()
                ]
              ),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // título da tela
                    RichText(
                      text: TextSpan(
                        text: 'Minhas ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'consultas.',
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

                    SizedBox(height: 6),

                    // subtítulo
                    Text(
                      'Acompanhe e gerencie seus agendamentos.',
                      style: TextStyle(
                        color: Color.fromRGBO(94, 94, 94, 1),
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ).animate().fadeIn(
                      duration: Duration(milliseconds: 1200),
                      delay: Duration(milliseconds: 750),
                    ),

                    SizedBox(height: 24),


                    // lista de consultas
                    consultasBuscadas?.isNotEmpty == true
                      ? Container(
                        constraints: BoxConstraints(
                          maxWidth: 700
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: consultasBuscadas!.length,
                          separatorBuilder: (context, _) => SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            // variaveis para criar o card da consulta
                            final data = DateTime.parse(consultasBuscadas![index]['data_e_horario']); // transforma a string do dia em um DateTime

                            final String dia = data.day.toString();
                            final String diaSemana = diasSemana[data.weekday - 1]; 
                            final String mes = meses[data.month];
                            final String ano = data.year.toString();
                            final String horario = "${data.hour.toString().padLeft(2, "0")}:00"; // padleft = caso o numero for menor que 10 => 9 => 09

                            return ConsultaCard(
                              nome: consultasBuscadas![index]["nome_profissional"],
                              profissao: consultasBuscadas![index]["profissao"],
                              cod: consultasBuscadas![index]["cod"],
                              local: consultasBuscadas![index]["loc"],
                              preco: "R\$ ${consultasBuscadas![index]["preco"]}",
                              data: "$dia de $mes de $ano",
                              diaSemana: diaSemana,
                              horario: horario,
                              funcaoCancelar: () {
                                _cancelarConsulta(index);

                                // resetar a pagina
                                Navigator.pushReplacementNamed(context, '/minhas_consultas');
                              },
                            )
                            .animate()
                            .slideY(
                              duration: Duration(milliseconds: 900),
                              begin: -0.4,
                              curve: Curves.easeOut,
                              delay: Duration(milliseconds: 850 + (index*10)),
                            )
                            .fadeIn(duration: Duration(milliseconds: 1200));
                          }
                        ),
                      )
                      : _SemConsultaState()
                      .animate()
                      .slideY(
                        duration: Duration(milliseconds: 900),
                        begin: -0.4,
                        curve: Curves.easeOut,
                        delay: Duration(milliseconds: 850),
                      )
                      .fadeIn(duration: Duration(milliseconds: 1200))
                  ],
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}



// tela exibida quando nao tem nenhuma consulta
class _SemConsultaState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 64,
            color: Color.fromRGBO(79, 97, 162, .25),
          ),
          SizedBox(height: 16),
          Text(
            'Você ainda não possui consultas agendadas.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(150, 150, 150, 1),
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
