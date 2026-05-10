import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_voltar.dart';
import 'package:pulsetime/widgets/card_consulta.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';

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


  // RECUPERAR PELO BACK END NO FUTURO
  final List<Map<String, dynamic>> consultasBuscadas = [
    {
      "id": 1,
      "profissional": "Marcos Lima",
      "profissao": "Clínico geral",
      "cod": "0123456789/2024",
      "loc": "Clínica 1",
      "preco": Decimal.parse("150.00"),
      "data_e_horario": DateTime.now()
    },
    {
      "id": 2,
      "profissional": "Marcos Lima",
      "profissao": "Clínico geral",
      "cod": "0123456789/2024",
      "loc": "Clínica 1",
      "preco": Decimal.parse("150.00"),
      "data_e_horario": DateTime.now()
    },
    {
      "id": 3,
      "profissional": "Marcos Lima",
      "profissao": "Clínico geral",
      "cod": "0123456789/2024",
      "loc": "Clínica 1",
      "preco": Decimal.parse("150.00"),
      "data_e_horario": DateTime.now()
    },
  ];

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
                    if (consultasBuscadas.isEmpty) _EmptyState()
                    else
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 700
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: consultasBuscadas.length,
                          separatorBuilder: (context, _) => SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final String dia = consultasBuscadas[index]['data_e_horario'].day.toString();
                            final String mes = meses[consultasBuscadas[index]['data_e_horario'].month];
                            final String ano = consultasBuscadas[index]['data_e_horario'].year.toString();
                            final String horario = "${consultasBuscadas[index]['data_e_horario'].hour.toString().padLeft(2, "0")}:00"; // padleft = caso o numero for menor que 10 => 9 => 09

                            return ConsultaCard(
                              nome: consultasBuscadas[index]["profissional"],
                              profissao: consultasBuscadas[index]["profissao"],
                              cod: consultasBuscadas[index]["cod"],
                              local: consultasBuscadas[index]["loc"],
                              preco: "R\$ ${consultasBuscadas[index]["preco"].toStringAsFixed(2)}",
                              data: "$dia de $mes de $ano",
                              horario: horario
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
class _EmptyState extends StatelessWidget {
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
