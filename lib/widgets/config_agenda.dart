

import 'package:flutter/material.dart';
import 'package:pulsetime/widgets/buttons/botao_continuar.dart';
import 'package:pulsetime/widgets/inputs/dia_semana_profissional.dart';
import 'package:pulsetime/widgets/inputs/select_input.dart';
import 'package:pulsetime/widgets/mensagem_erro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigAgenda extends StatefulWidget {
  final bool jaTemAgenda;

  const ConfigAgenda({super.key, required this.jaTemAgenda});

  @override
  State<StatefulWidget> createState() => _ConfigAgendaWidget();

}

class _ConfigAgendaWidget extends State<ConfigAgenda> {
  final ScrollController _scrollController = ScrollController();

  static List<Map<String, dynamic>> dias = [
    {"label": "Seg", "value": 1},
    {"label": "Ter", "value": 2},
    {"label": "Qua", "value": 3},
    {"label": "Qui", "value": 4},
    {"label": "Sex", "value": 5},
    {"label": "Sáb", "value": 6},
    {"label": "Dom", "value": 7},
  ];

  final List<int> diasSelecionados = [];



  static List<String> horarios = [
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
  ];

  String ?_horarioInicioSelecionado;
  String ?_horarioFimSelecionado;
  List<String> ?_horariosFim;


  
  String ?_erro;

  @override
  void initState() {
    _horarioInicioSelecionado = null;
    _horarioFimSelecionado = null;
    _horariosFim;
    super.initState();
  }

  // METODO PARA TESTES, POSSIVELMENTE NO FUTURO TROCAR APENAS PARA RECARREGAR A PAGINA COM A AGENDA SALVA
  Future<void> _mudarStatusAgenda() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool("temAgenda", true);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      constraints: BoxConstraints(maxWidth: 573),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //titulo
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
                  "assets/images/calendar-249.png",
                  width: 36,
                  height: 36,
                ),
              ),

              SizedBox(width: 10,),

              // texto
              Text(
                "Configuração da agenda",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),

          SizedBox(height: 5,),

          Text(
            "Os dias e horários selecionados serão disponíveis para agendamento.",
            style: TextStyle(
              color: Color.fromRGBO(94, 94, 94, 1),
              fontSize: 14,
            ),
          ),


          SizedBox(height: 10,),


          Text(
            "Dias disponíveis:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),


          SizedBox(height: 5,),

          // dias da semana para selecionar
          // EM DIAS E HORARIOS, RECUPERAR OS SALVOS SE A AGENDA JA ESTA CADASTRADA (DEIXAR POR ULTIMO PARA RECUPERAR VALORES PARA CAMPOS DE ATUALIZAÇÃO)
          Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: dias.map((dia) {
                  final bool selecionado = diasSelecionados.contains(dia["value"]);

                  return DiaSemanaProfissional(
                    label: dia["label"], 
                    corFundo: selecionado ? Color.fromRGBO(0, 147, 22, .4) : Colors.transparent, 
                    corBorda: selecionado ? Color.fromRGBO(0, 94, 14, .4) : Color.fromRGBO(79, 97, 162, .15),
                    onTap: () {
                      setState(() {
                        if(selecionado){
                          diasSelecionados.remove(dia["value"]);
                        } else {
                          diasSelecionados.add(dia["value"]);
                        }
                      });
                    });
                  }).toList(),
              )
              
            )
          ),

          SizedBox(height: 10,),



          Text(
            "Horário de atendimento:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 5,),

          // inputs para selecionar o horario
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // input 1
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // label
                    Text(
                      "Início",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromRGBO(94, 94, 94, 1),
                        fontSize: 14,
                      ),
                    ),

                    SizedBox(height: 3,),

                    // input
                    SelectInput(
                      icone: "assets/images/clockpng.png", 
                      placeholder: "08:00", 
                      items: horarios, 
                      value: _horarioInicioSelecionado, 
                      fontSize: 16,
                      funcao: (String ?value) {
                        setState(() {
                          _horarioInicioSelecionado = value;

                          final int index = horarios.indexOf(_horarioInicioSelecionado!);
                          _horariosFim = horarios.sublist(index + 1);

                          _horarioFimSelecionado = null;
                        });
                      }
                    )
                  ],
                ),
              ),

              // input2
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // label
                    Text(
                      "Fim",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromRGBO(94, 94, 94, 1),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 3,),

                    // input
                    SelectInput(
                      icone: "assets/images/clockpng.png", 
                      placeholder: "18:00", 
                      items: _horariosFim ?? [], 
                      value: _horarioFimSelecionado, 
                      fontSize: 16,
                      funcao: (String ?value) {
                        setState(() {
                          _horarioFimSelecionado = value;
                        });
                      }
                    )
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 5,),

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
                  "Os horários selecionados serão disponíveis para agendamento.",
                  style: TextStyle(
                    color: Color.fromRGBO(94, 94, 94, 1),
                    fontSize: 12
                  ),
                ),
              )
            ],
          ),
        
          SizedBox(height: 30,),

          

          _erro != null ? MensagemErro(mensagem: _erro!) : SizedBox(),
          SizedBox(height: 10,),


          // botao de salvar agenda ou salvar alteracoes
          BotaoContinuar(
            comIcone: false, 
            texto: widget.jaTemAgenda ? "Salvar alterações" : "Salvar agenda", 
            funcao: () {
              
              // verificar inputs
              if(diasSelecionados.isEmpty || _horarioInicioSelecionado == null || _horarioFimSelecionado == null){
                setState(() {
                  _erro = "Por favor, selecione ao menos um dia e defina o seu horário de atendimento";
                });
                return;
              }

              

              // CHAMAR O BACK END AQUI PARA SALVAR A AGENDA DO PROFISSIONAL!!!

              _mudarStatusAgenda();



              setState(() {
                _erro = null;
              });
              // resetar a pagina
              Navigator.pushReplacementNamed(context, '/minha_agenda');

            }
          ),

          SizedBox(height: 10,)
        ]
      )
    );
  }

}