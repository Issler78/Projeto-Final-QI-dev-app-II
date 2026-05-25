import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_voltar.dart';
import 'package:pulsetime/widgets/config_agenda.dart';
import 'package:pulsetime/widgets/agenda.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MinhaAgenda extends StatefulWidget {
  const MinhaAgenda({super.key});

  @override
  State<StatefulWidget> createState() => _MinhaAgenda();
  
}

class _MinhaAgenda extends State<MinhaAgenda> {

  bool temAgenda = false;

  Future<void> getAgenda() async {
    final prefs = await SharedPreferences.getInstance();
    
    bool pref = prefs.getBool("temAgenda") ?? false;    
    setState(() {
      temAgenda = pref;
    });
  }

  @override
  Widget build(BuildContext context) {
    // PARA TESTE = RECUPERAR PELO BACKEND SE O PROFISSIONAL JA TEM DIAS DISPONIVEIS
    getAgenda();

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
                padding: EdgeInsets.only(left: 5, right: 5),
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 700),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Gerencie ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "sua agenda.",
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
                        "Defina sua disponibilidade e acompanhe suas consultas",
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

                    SizedBox(height: 20),

                    

                    // container de configuração da agenda
                    ConfigAgenda(jaTemAgenda: temAgenda)
                    .animate()
                    .slideY(
                      duration: Duration(milliseconds: 1400),
                      begin: -0.5,
                      curve: Curves.easeOut,
                      delay: Duration(milliseconds: 950),
                    )
                    .fadeIn(duration: Duration(milliseconds: 850)),

                    SizedBox(height: 30,),

                    Divider(),

                    SizedBox(height: 30,),
                    
                    // minha agenda (FUTURAMENTE MANDAR PARA ESSA CLASSE AS CONSULTAS MARCADAS COM O PROFISSIONAL)
                    if(temAgenda)

                      Container(
                        constraints: BoxConstraints(maxWidth: 600),
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
                                  "Agenda do mês",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ]
                            ),

                            SizedBox(height: 20,),

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
                              delay: Duration(milliseconds: 1000),
                            )
                            .fadeIn(duration: Duration(milliseconds: 850)),

                            Row(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 147, 22, 1),
                                    shape: BoxShape.circle
                                  ),
                                ),

                                Text(
                                  "Com consultas",
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
                              delay: Duration(milliseconds: 1000),
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
                              delay: Duration(milliseconds: 1000),
                            )
                            .fadeIn(duration: Duration(milliseconds: 850)),



                            SizedBox(height: 5),
                            AgendaWidget(), 
                            SizedBox(height: 10,)
                          ]
                        )
                      ).animate().slideY(
                          duration: Duration(milliseconds: 1400),
                          begin: -0.5,
                          curve: Curves.easeOut,
                          delay: Duration(milliseconds: 1100),
                        )
                        .fadeIn(duration: Duration(milliseconds: 850)),
                      
                    if(!temAgenda)
                      Align(
                        alignment: AlignmentGeometry.center,
                        child: Column(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Color.fromRGBO(94, 94, 94, 1),
                              size: 32,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Sem agenda cadastrada...",
                              style: TextStyle(
                                color: Color.fromRGBO(94, 94, 94, 1),
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ).animate().slideY(
                          duration: Duration(milliseconds: 1400),
                          begin: -0.5,
                          curve: Curves.easeOut,
                          delay: Duration(milliseconds: 1100),
                        )
                        .fadeIn(duration: Duration(milliseconds: 850)),

                    SizedBox(height: 30,),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}