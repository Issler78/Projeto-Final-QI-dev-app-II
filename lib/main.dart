import 'package:flutter/material.dart';
import 'package:pulsetime/pages/agendar_consulta.dart';
import 'package:pulsetime/pages/cadastro.dart';
import 'package:pulsetime/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsetime/pages/login.dart';
import 'package:pulsetime/pages/minha_agenda.dart';
import 'package:pulsetime/pages/minhas_consultas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseTime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/cadastrar": (context) => Cadastro(),
        "/login": (context) => Login(),
        "/consulta": (context) => TipoConsulta(),
        "/minhas_consultas": (context) => MinhasConsultas(),
        "/minha_agenda": (context) => MinhaAgenda()
      },
    );
  }

}
