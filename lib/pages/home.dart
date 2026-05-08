import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });
  
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  bool logado = false;

  @override
  void initState() {
    super.initState();
    _estaLogado();
  }

  Future<void> _estaLogado() async {
    // verificar se o usuario esta logado e muda o estado da variavel
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      logado = prefs.getBool("logado") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // suporte para AppBar, body, etc
      resizeToAvoidBottomInset: false, // evitar que o teclado redimensione a tela
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, 
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),// 100%
          decoration: BoxDecoration(
            // para estilizar
            color: Colors.white,
          ),
          child: Column(
            children: [
              // logo com gradiente no fundo
              PaginaTopo(height: 370),

              SizedBox(height: 10),

              // titulo
              RichText(
                text: TextSpan(
                  text: "Bem-vindo ao ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Pulse",
                      style: TextStyle(
                        color: Color.fromRGBO(11, 180, 255, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Time",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 147, 22, 1),
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

              SizedBox(height: 20),

              // subtitulo
              SizedBox(
                width: 300,
                child: Text(
                  "Agende consultas com facilidade e rapidez.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(94, 94, 94, 1),
                    fontSize: 24,
                    height: 1.2,
                  ),
                ),
              ).animate().fadeIn(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 900),
              ),

              SizedBox(height: 50),

              // botoes

              // botao agendar consulta / cadastrar (MUDAR DEPOIS DE LOGADO!!!)
              Container(
                decoration: BoxDecoration(
                  // decorando o botao
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(77, 255, 98, 1),
                      Color.fromRGBO(84, 127, 255, 1),
                    ],
                    begin: AlignmentGeometry.centerStart,
                    end: AlignmentGeometry.centerEnd,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: List.of([
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ]),
                ),
                height: 78,
                width: double.infinity,
                margin: EdgeInsets.only(left: 35, right: 35),
                constraints: BoxConstraints(maxWidth: 700),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    // deixando o "botao" transparente para utilizar o background do container
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    iconAlignment: IconAlignment.start,
                    shadowColor: WidgetStateProperty.all(Colors.transparent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    alignment: AlignmentGeometry.center,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, logado ? "/consulta" : "/cadastrar");
                  },
                  icon: Image.asset(
                    logado ? "assets/images/calendarw.png" : "assets/images/useradd.png",
                    width: 58,
                    height: 58,
                  ),
                  label: Text(
                    logado ? "Agendar Consulta" : "Cadastrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  iconAlignment: IconAlignment.start,
                ),
              ).animate().fadeIn(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 1100),
              ),

              SizedBox(height: 30),

              // botao minhas consultas / entrar (MUDAR DEPOIS DE LOGADO!!!)
              Container(
                decoration: BoxDecoration(
                  // decorando o botao
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: List.of([
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ]),
                ),
                height: 78,
                width: double.infinity,
                margin: EdgeInsets.only(left: 35, right: 35),
                constraints: BoxConstraints(maxWidth: 700),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    // deixando o "botao" transparente para utilizar o background do container
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    shadowColor: WidgetStateProperty.all(Colors.transparent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    alignment: AlignmentGeometry.center,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  icon: Image.asset(
                    logado ? 'assets/images/clockgpng.png' : 'assets/images/userg.png',
                    width: 58,
                    height: 60,
                  ),
                  label: Text(
                    logado ? "Minhas Consultas" : "Entrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 147, 22, 1),
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  iconAlignment: IconAlignment.start,
                ),
              ).animate().fadeIn(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 1300),
              ),

              SizedBox(height: 40),

              // texto parte de baixo da tela
              Text(
                "Precisa de ajuda?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(94, 94, 94, 1),
                ),
              ).animate().fadeIn(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 1400),
              ),
              Text(
                "Fale com a nossa equipe.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: .8,
                  fontSize: 18,
                  color: Color.fromRGBO(84, 86, 250, 1),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(84, 86, 250, 1),
                ),
              ).animate().fadeIn(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 1400),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
