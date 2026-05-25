import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/pages/agendar_consulta.dart';
import 'package:pulsetime/widgets/buttons/botao_continuar.dart';
import 'package:pulsetime/widgets/mensagem_erro.dart';

class CalendarioEHorariosWidget extends StatefulWidget {
  final int profissionalId;
  final String nome;
  final String cod;
  final String profissao;
  final String loc;
  final Decimal preco;
  final String imagem;

  const CalendarioEHorariosWidget({super.key, required this.profissionalId, required this.nome, required this.profissao, required this.loc, required this.preco, required this.cod, required this.imagem});

  @override
  State<StatefulWidget> createState() => _CalendarioState();
}

class _CalendarioState extends State<CalendarioEHorariosWidget> {
  DateTime? dataSelecionada;
  String? horarioSelecionado; // possivelmente tera que trocar de formato no futuro
  DateTime mesAtual = DateTime.now();
  String ?_erro;

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

  // dias que o profissional horários disponiveis
  // RETORNAR DEPOIS DO BACK END COM O ID DO PROFISSIONAL E O MES
  final List<int> diasDisponiveis = [
    4,
    6,
    10,
    11,
    12,
    16,
    20,
    22,
    23,
    24,
    26,
    27,
    28,
  ];

  List<String?> horariosDisponiveis = [];
  void _horariosDisponiveisNoDia(DateTime dia){
    // BUSCAR NO BANCO DE DADOS. OS HORARIOS DISPONIVEIS NO DIA QUANDO O DIA FOR SELECIONADO

    setState(() {
      horariosDisponiveis = ["07:00", "08:00", "10:00", "11:00", "12:00", "13:00", "14:00", "16:00", "17:00", "18:00"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // input
        Container(
          width: double.infinity,
          height: 310,
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
              // cabecalho de mes
              _cabecalhoMes(),

              // cabecalho com os dias da semana
              _cabecalhoDiasSemana(),

              // grid com dias do mes
              _gridDias(),

            ],
          ),
        ),



        SizedBox(height: 10),
        Divider()
          .animate()
          .slideY(
            duration: Duration(milliseconds: 500),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 850),
          )
          .fadeIn(duration: Duration(milliseconds: 900)),



        // horarios
        Text(
          "Horários disponíveis:",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color.fromRGBO(94, 94, 94, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )
        .animate()
        .slideY(
          duration: Duration(milliseconds: 700),
          begin: -0.5,
          curve: Curves.easeOut,
          delay: Duration(milliseconds: 850),
        )
        .fadeIn(duration: Duration(milliseconds: 900)),
        SizedBox(height: 5,),


        // grid de horarios
        _gridHorarios(),
        SizedBox(height: 30,),


        _erro != null ? MensagemErro(mensagem: _erro!) : SizedBox(),
        SizedBox(height: 10,),


        // botao
        BotaoContinuar(comIcone: true, texto: "Continuar", funcao: () {

          // verificação se a data e o horario foram escolhidos
          if(dataSelecionada == null || horarioSelecionado == null){
            setState(() {
              _erro = "Por favor, selecione uma data e um horário para prosseguir";
            });
            return;
          }

          // transformar a data e horario selecionado em DateTime
          final dataHorario = DateTime(
            dataSelecionada!.year,
            dataSelecionada!.month,
            dataSelecionada!.day,
            int.parse(horarioSelecionado.toString().split(":")[0]) // converte a string da hora em numero int
          );




          setState(() {
            _erro = null;
          });
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ResumoConsultaPage(
                profissionalId: widget.profissionalId, 
                nome: widget.nome,
                cod: widget.cod,
                profissao: widget.profissao, 
                loc: widget.loc, 
                preco: widget.preco, 
                dataHorario: dataHorario,
                imagem: widget.imagem,
              )
            )
          );

        }),
        SizedBox(height: 30,),
      ],
    );
  }



  // funcoes cabecalho
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

  // cabecalho com mes + ano
  Widget _cabecalhoMes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // icone seta esquerda
        RotatedBox(
          // rotacionar a imagem
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

        // mes e ano
        Text(
          "${meses[mesAtual.month - 1]} ${mesAtual.year.toString()}", // mesAtual.month = numero de 1 a 12, que conseguimos referenciar na variavel meses (lembrando que index de meses começa em 0)
          style: TextStyle(fontSize: 18, color: Color.fromRGBO(94, 94, 94, 1)),
        ),

        // icone seta direita
        RotatedBox(
          // rotacionar a imagem
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

  Widget _cabecalhoDiasSemana() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // fazer uma [], com um expandede para cada dia
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



  // funcoes grid

  int _diasNoMes(DateTime dataAtual) {
    // passamos o mes seguinte e o dia = 0 para fazer: O dia anterior ao dia passado, ou seja
    // mesAtual = maio
    // mes + 1 = junho
    // dia anterior do mes + 1 = 31 de maio
    // 31 = quantidade de dias no mes
    return DateTime(dataAtual.year, dataAtual.month + 1, 0).day;
  }

  int _primeiroDiaSemana(DateTime dataAtual) {
    // retorna o primeiro dia da semana do mes, começando em domingo = 0

    // .weekday retorna o dia da semana começando na segunda como 1, por isso para nos, o domingo sera 0, por causa do index das listas

    // resto da divisao por 7 pq: Terça = 2 (com base em weekday), 2 % 7 = 2 (sobrou o proprio 2, que nao cabe no 7)
    // no domingo: 7 % 7 = 0 (resta 0, ideal agora para usarmos como index)
    return DateTime(dataAtual.year, dataAtual.month, 1).weekday % 7;
  }

  Widget _linhaSemana(List<int?> semana) {
    // caso a ultima semana for incompleta
    while (semana.length < 7) {
      // [domingo, segunda, terça, quarta] => [domingo, segunda, terça, quarta, null, null, null]

      semana.add(null);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // para cada dia, cria um dia container
      children: semana.map((dia) => _diaContainer(dia)).toList(),
    );
  }

  Widget _diaContainer(int? dia) {
    if (dia == null) {
      return const SizedBox(width: 36, height: 36); // dia vazio caso seja null
    }



    // verifica se o dia esta selecionado, verificando seu dia, mes e ano
    final bool estaSelecionado = dataSelecionada != null
    ? dia == dataSelecionada!.day &&
    mesAtual.month == dataSelecionada!.month &&
    mesAtual.year == dataSelecionada!.year
    : false;



    // se o dia é o dia de hoje (para colocar uma cor no fundo de cinza)
    final bool ehHoje = dia == DateTime.now().day &&
    mesAtual.month == DateTime.now().month &&
    mesAtual.year == DateTime.now().year;



    // data do container do dia
    final DateTime dataDoDia = DateTime(
      mesAtual.year,
      mesAtual.month,
      dia,
    );
    
    // data de hoje
    final DateTime hojeData = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );



    // verifica se o dia esta disponivel para agendar horario (verifica se esta disponivel nos dias disponiveis e se nao é uma data antiga)
    final bool estaDisponivel =
      diasDisponiveis.contains(dia) &&
      dataDoDia.isAfter(hojeData);


    return MouseRegion(
      cursor: estaDisponivel
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: estaDisponivel
            ? () {
                setState(() {
                  dataSelecionada = DateTime(
                    mesAtual.year,
                    mesAtual.month,
                    dia,
                  );
                });

                _horariosDisponiveisNoDia(dataSelecionada!);
              }
            : null,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            // se esta selecionado, tem fundo azul
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
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: estaSelecionado
                      ? Colors.white
                      : ehHoje
                      ? Colors.black
                      : estaDisponivel
                      ? Color.fromRGBO(0, 147, 22, 1)
                      : Color.fromRGBO(94, 94, 94, 1)
              ),
            ),
          ),
        ),
      ),
    );
  }

  // grid de dias
  Widget _gridDias() {
    final int totalDias = _diasNoMes(mesAtual);
    final int inicioSemana = _primeiroDiaSemana(mesAtual);

    final List<int?> gridDias = [
      ...List.filled(
        inicioSemana,
        null,
      ), // espaco vazio antes do inicio do mes, ou seja, se o mes começa em uma terça, inicioSemana = 2, faz com que tenham 2 valores nulos no inicio dessa lista
      ...List.generate(
        totalDias,
        (i) => i + 1,
      ), // gera uma lista ate o total de dias no mes, onde começa em 1, e vai aumentando de 1 em 1
    ];

    // dividir em listas/linhas de 7
    final List<List<int?>> semanas = [];
    for (int i = 0; i < gridDias.length; i += 7) {
      // sublist = pega um pedaço da lista de grid, terminando a sublista em i+7 (em conjunto com o index da semana, iniciado nesse for, e incrementado de 7 em 7)

      // i + 7 > gridDias.length ? gridDias.length : i + 7
      // faz uma verificaão para a ultima semana, que pode ser menor que as outras, por isso verificamos se i+7 passa dos dias presentes no mes, se exceder, a ultima lista vai apenas até o ultimo dia, se nao, ela incrementa +7
      semanas.add(
        gridDias.sublist(i, i + 7 > gridDias.length ? gridDias.length : i + 7),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // para cada semana, cria uma linha da semana
      children: semanas.map((semana) => _linhaSemana(semana)).toList(),
    );
  }



  // funcoes do grid de horarios
  Widget _linhaHorario(List<String?> linhaHorario){
    while (linhaHorario.length < 3) {
      // [13:00] => [13:00, null, null]

      linhaHorario.add(null);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // para cada horario, cria um horario container
      children: linhaHorario.map((horario) => _horarioContainer(horario)).toList(),
    ).animate()
      .slideY(
        duration: Duration(milliseconds: 600),
        begin: -0.5,
        curve: Curves.easeOut,
        delay: Duration(milliseconds: 200),
      )
      .fadeIn(duration: Duration(milliseconds: 900));
  }

  Widget _horarioContainer(String? horario) {
    if (horario == null) {
      return const SizedBox(width: 108, height: 40); // dia vazio caso seja null
    }

    return Container(
      decoration: BoxDecoration(
        color: horarioSelecionado == horario ? Color.fromRGBO(11, 180, 255, 1) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: BoxBorder.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        )
      ),
      height: 40,
      width: 108,
      child: ElevatedButton(
        style: ButtonStyle(
          // deixando o "botao" transparente para utilizar o background do container
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            ),
          ),
        ),
        onPressed: () async {
          setState(() {
            horarioSelecionado = horario;
          });
        }, 
        child: Text(
          horario,
          style: TextStyle(
            color: horarioSelecionado == horario ? Colors.white : Color.fromRGBO(94, 94, 94, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }

  // grid de horarios
  Widget _gridHorarios(){
    // fazer linhas com 3 containers em cada
    List<List<String?>> linhasHorarios = [];
    for (int i = 0; i < horariosDisponiveis.length; i += 3) {
      linhasHorarios.add(
        horariosDisponiveis.sublist(i, i + 3 > horariosDisponiveis.length ? horariosDisponiveis.length : i + 3)
      );
    }
    
    return horariosDisponiveis.isEmpty ? SizedBox(height: 20,) : Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      // para cada linha de horario, cria uma linha dos horarios
      children: linhasHorarios.map((linhaHorario) => _linhaHorario(linhaHorario)).toList(),
    );
  }

}