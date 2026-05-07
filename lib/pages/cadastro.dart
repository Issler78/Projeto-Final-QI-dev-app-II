import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_perfil.dart';
import 'package:pulsetime/widgets/buttons/botao_voltar.dart';
import 'package:pulsetime/widgets/forms/form_cad.dart';
import 'package:pulsetime/widgets/pagina_topo.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

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
                        "Antes de tudo,",
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
                        "precisamos conhecer",
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
                        "um pouco mais você...",
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
                          "Preencha seus dados com atenção. Isso nos ajuda a oferecer a melhor experiência para você.",
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


                      SizedBox(height: 25),

                      
                      // form
                      FormCad1()

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



class Cadastro2 extends StatelessWidget {
  final String nome;
  final String email;
  final String telefone;
  final String dataNasc;
  final String sexo;

  const Cadastro2({super.key, required this.nome, required this.email, required this.telefone, required this.dataNasc, required this.sexo});

  @override
  Widget build(BuildContext context) {
    print("Nome: $nome");
    print("email: $email");
    print("tel: $telefone");
    print("data: $dataNasc");
    print("sexo: $sexo");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // 100%
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
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
                        "Quase lá...",
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
                        "Complete os",
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
                        "últimos detalhes.",
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
                          "Falta pouco! Só precisamos de mais algumas informações para continuar.",
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


                      SizedBox(height: 25),

                      FormCad2(nome: nome, email: email, telefone: telefone, dataNasc: dataNasc, sexo: sexo,),

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



class Cadastro3 extends StatelessWidget {
  final String nome;
  final String email;
  final String telefone;
  final String dataNasc;
  final String sexo;
  final String cpf;
  final String senha;

  const Cadastro3({super.key, required this.nome, required this.email, required this.telefone, required this.dataNasc, required this.sexo, required this.cpf, required this.senha});

  @override
  Widget build(BuildContext context) {
    print("Nome: $nome");
    print("email: $email");
    print("tel: $telefone");
    print("data: $dataNasc");
    print("sexo: $sexo");
    print("cpf: $cpf");
    print("senha: $senha");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // 100%
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
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
                padding: EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RichText(
                        text: TextSpan(
                          text: "Quem ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "é ",
                              style: TextStyle(
                                color: Color.fromRGBO(11, 180, 255, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "você?",
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



                      SizedBox(height: 30),



                      // subtitulo
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 650
                        ),
                        child: Text(
                          "Escolha o perfil que melhor te representa.",
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


                      SizedBox(height: 40),

                      
                      // botoes de escolha de perfil
                      BotaoPerfil(icone: "assets/images/Sample_User_Icon.png", textoPerfil: "Sou paciente", subtexto: "Quero agendar consultas para cuidar da minha saúde.", funcao: () {

                        const String regra = "Paciente";
                        print(regra);

                        // chamar cadastro do usuario!!!
                        // chamar login do usuario!!!

                        // mandar para tela inicial, agora logado
                        Navigator.pushNamed(
                          context, 
                          "/"
                        );

                      }).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 950),
                      ),



                      SizedBox(height: 20,).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 950),
                      ),



                      BotaoPerfil(icone: "assets/images/est.png", textoPerfil: "Sou profissional", subtexto: "Quero gerenciar minha agenda e meus pacientes.", funcao: () {

                        const String regra = "Profissional";
                        print(regra);

                        // chamar cadastro do usuario!!!
                        // chamar login do usuario!!!

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroProfissional()
                          ) 
                        );

                      }).animate().fadeIn(
                        duration: Duration(milliseconds: 1200),
                        delay: Duration(milliseconds: 1000),
                      ),
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



// cadastro de profissional
class CadastroProfissional extends StatelessWidget {

  const CadastroProfissional({ super.key });

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
                        "Vamos conhecer",
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
                        "você melhor, ",
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
                        "profissional!",
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
                          "Preencha seus dados com atenção. Isso nos ajuda a oferecer a melhor experiência para você.",
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


                      SizedBox(height: 25),

                      
                      // form
                      FormCadProfissional()

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