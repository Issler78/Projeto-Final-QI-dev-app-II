import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_continuar.dart';
import 'package:pulsetime/widgets/linha_paciente.dart'; // importar o widget de linha de paciente

class AgendaWidget extends StatefulWidget {
  const AgendaWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AgendaState();
}

class _AgendaState extends State<AgendaWidget> {
  DateTime? dataSelecionada;
  DateTime mesAtual = DateTime.now();

  // meses
  final List<String> meses = [
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
  final List<String> diasSemana = ["D", "S", "T", "Q", "Q", "S", "S"];

  // dias que o profissional possui horários disponíveis
  // RETORNAR DO BACK-END COM O ID DO PROFISSIONAL E O MÊS
  final List<int> diasDisponiveis = [4, 6, 16, 20, 23, 24, 26];

  // dias que possuem consulta marcada
  // RETORNAR DO BACK-END CONFORME O MÊS SELECIONADO
  final List<int> diasComConsultas = [4, 16, 24];

  // pacientes do dia selecionado
  // RETORNAR DO BACK-END CONFORME O DIA SELECIONADO (nome, id e horário de cada paciente)
  final List<Map<String, dynamic>> pacientes = [
    {"id": 1, "nome": "Júlio César", "horario": "09:00"},
    {"id": 2, "nome": "Amanda Oliveira", "horario": "14:00"},
    {"id": 3, "nome": "Alice Neves", "horario": "17:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // calendario
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
          child: Column(
            children: [
              // montando o calendario
              _cabecalhoMes(),
              _cabecalhoDiasSemana(),
              _gridDias(),
            ],
          ),
        ),



        // lista de pacientes (possui ... por que dessa forma o if implementa cada elemento dessa list de widgets diretamente na column final)
        // verifica se possui consulta nesse dia selecionado
        if (dataSelecionada != null && diasComConsultas.contains(dataSelecionada!.day)) ...[
          SizedBox(height: 20),
          Divider(),

          // titulo
          Row(
            children: [
              // icone
              Container(
                width: 36,
                height: 36,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(79, 97, 162, .15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/clockpng.png",
                  width: 36,
                  height: 36,
                ),
              ),

              SizedBox(width: 10),

              // texto
              Text(
                "Consultas do dia",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),



          // linhas de pacientes do dia selecionado
          if (pacientes.isEmpty)
            // mensagem se nao tiver consulta marcada no dia (SÓ SERA MUDADA QUANDO O BACK END BUSCAR PELOS PACIENTES EM TEMPO REAL CONFORME O DIA SELECIONADO)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  "Nenhuma consulta neste dia.",
                  style: TextStyle(
                    color: Color.fromRGBO(150, 150, 150, 1),
                    fontSize: 14,
                  ),
                ),
              ),
            )
          else
            // se tiver consulta marcada, cria uma list view, com cada paciente
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pacientes.length,
              separatorBuilder: (context, _) => SizedBox(height: 8),
              itemBuilder: (context, index) =>
                LinhaPaciente(
                  id: pacientes[index]["id"],
                  nome: pacientes[index]["nome"],
                  horario: pacientes[index]["horario"],
                  onExcluir: () {
                    // LOGICA PARA EXCLUIR UMA CONSULTA AQUI!!!
                    // VERIFICAR SE O PROFISSIONAL DA CONSULTA É O DONO DA AGENDA, PARA SER POSSIVEL EXCLUIR
                  },
                )
                .animate()
                .slideY(
                  duration: Duration(milliseconds: 900),
                  begin: -0.4,
                  curve: Curves.easeOut,
                  delay: Duration(milliseconds: 100 + (index * 10)),
                )
                .fadeIn(duration: Duration(milliseconds: 1200)),
            ),
        ],

        SizedBox(height: 30),

        // botao para adicionar mais dias na agenda
        BotaoContinuar(
          comIcone: false,
          texto: "Adicionar mais dias",
          funcao: () {
            // logica para adicionar +30 dias na agenda e resetar a pagina AQUI!!!
            Navigator.pushReplacementNamed(context, '/minha_agenda');
          },
        ),

        SizedBox(height: 10,),
                // texto de info
        Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Color.fromRGBO(11, 180, 255, 1),
              size: 18,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Text(
                "Adicionar mais dias resultará em +30 dias disponíveis com essas configurações definidas.",
                style: TextStyle(
                  color: Color.fromRGBO(94, 94, 94, 1),
                  fontSize: 12
                ),
              ),
            )
          ],
        ),
      
      ],
    );
  }



  //funcoes do cabecalho

  void _proxMes() {
    // verifica se o mes atual é dezembro, para resetar a contagem
    int numProx = mesAtual.month < 12 ? mesAtual.month + 1 : 1;
    setState(() {
      mesAtual = DateTime(mesAtual.year, numProx, 1);
    });
  }

  void _antMes() {
    // verifica se o mes atual é janeiro, para resetar a contagem para dezembro
    int numAnt = mesAtual.month > 1 ? mesAtual.month - 1 : 12;
    setState(() {
      mesAtual = DateTime(mesAtual.year, numAnt, 1);
    });
  }

  // cabecalho com mes + ano e setas de navegacao
  Widget _cabecalhoMes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
          quarterTurns: 0,
          child: IconButton(
            icon: Image.asset(
              "assets/images/back.png",
              opacity: const AlwaysStoppedAnimation(.5),
              width: 28,
              height: 25,
            ),
            onPressed: _antMes,
          ),
        ),

        Text(
          "${meses[mesAtual.month - 1]} ${mesAtual.year.toString()}",
          style: TextStyle(fontSize: 18, color: Color.fromRGBO(94, 94, 94, 1)),
        ),

        RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: Image.asset(
              "assets/images/back.png",
              opacity: const AlwaysStoppedAnimation(.5),
              width: 28,
              height: 25,
            ),
            onPressed: _proxMes,
          ),
        ),
      ],
    );
  }

  // cabecalho com as letras dos dias da semana
  Widget _cabecalhoDiasSemana() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: diasSemana
          .map(
            (dia) => Expanded(
              child: Center(
                child: Text(
                  dia,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(94, 94, 94, 1),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }



  // funcoes do grid de dias

  int _diasNoMes(DateTime dataAtual) {
    // forma para retornar quantos dias no mes tem
    // datetime criado com mes + 1 e dia 0, faz com que o dia seja tratado como o dia de ontem, logo, o dia de ontem, do primeiro dia do proximo mes, com isso descobrimos quantos dias o mes atual possui
    return DateTime(dataAtual.year, dataAtual.month + 1, 0).day;
  }

  int _primeiroDiaSemana(DateTime dataAtual) {
    // weekday começa na segunda como 1, ou seja, % 7 converte domingo de 7 para 0, para usar como index
    return DateTime(dataAtual.year, dataAtual.month, 1).weekday % 7;
  }

  Widget _linhaSemana(List<int?> semana) {
    // se a ultima semana for menor que 7 dias, completa com null
    while (semana.length < 7) {
      semana.add(null);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: semana.map((dia) => _diaContainer(dia)).toList(),
    );
  }

  Widget _diaContainer(int? dia) {
    if (dia == null) {
      return const SizedBox(width: 40, height: 40);
    }

    // se o dia esta disponivel para ter consulta
    final bool estaDisponivel = diasDisponiveis.contains(dia);

    // se o dia possui consultas marcadas
    final bool temConsulta = diasComConsultas.contains(dia);

    // se o dia esta selecionado
    final bool estaSelecionado = dataSelecionada != null
    ? dia == dataSelecionada!.day &&
    mesAtual.month == dataSelecionada!.month &&
    mesAtual.year == dataSelecionada!.year
    : false;

    // se o dia é o dia de hoje
    final bool ehHoje = dia == DateTime.now().day &&
    mesAtual.month == DateTime.now().month &&
    mesAtual.year == DateTime.now().year;

    return MouseRegion(
      cursor: estaDisponivel
      ? SystemMouseCursors.click
      : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: estaDisponivel ? () {
          setState(() {
            dataSelecionada = DateTime(
              mesAtual.year,
              mesAtual.month,
              dia,
            );

            // BUSCAR CONSULTAS DO DIA SELECIONADO NO BACKEND AQUI!!!
          });
        }
        : null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: estaSelecionado
                  ? Color.fromRGBO(11, 180, 255, 1)
                  : ehHoje
                  ? Color.fromRGBO(94, 94, 94, .25)
                  : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dia.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: estaDisponivel
                      ? FontWeight.w600
                      : FontWeight.normal,
                    color: estaSelecionado
                      ? Colors.white
                      : ehHoje
                      ? Colors.black
                      : estaDisponivel
                      ? Color.fromRGBO(0, 147, 22, 1)
                      : Color.fromRGBO(94, 94, 94, 1),
                  ),
                ),
              ),
            ),

            // indicador de consulta marcada no dia
            if (temConsulta)
              Positioned(
                bottom: 4,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: estaSelecionado
                      ? Colors.white
                      : Color.fromRGBO(0, 147, 22, 1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // grid de dias do mes dividido em linhas de 7
  Widget _gridDias() {
    final int totalDias = _diasNoMes(mesAtual);
    final int inicioSemana = _primeiroDiaSemana(mesAtual);

    final List<int?> gridDias = [
      ...List.filled(inicioSemana, null),
      ...List.generate(totalDias, (i) => i + 1),
    ];

    final List<List<int?>> semanas = [];
    for (int i = 0; i < gridDias.length; i += 7) {
      semanas.add(
        gridDias.sublist(i, i + 7 > gridDias.length ? gridDias.length : i + 7),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: semanas.map((semana) => _linhaSemana(semana)).toList(),
    );
  }
}
