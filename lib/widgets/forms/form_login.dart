import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pulsetime/widgets/buttons/botao_continuar.dart';
import 'package:pulsetime/widgets/inputs/text_input.dart';
import 'package:pulsetime/widgets/mensagem_erro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});
  
  @override
  State<FormLogin> createState() {
    return _FormLoginState();
  }
}

class _FormLoginState extends State<FormLogin>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  String ?_erro;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 800
      ),
      child: Column(
        children: [
          // campos
          
          // campo de email
          TextInput(icone: "assets/images/email.webp", placeholder: "E-mail", controller: _emailController, keyboardType: TextInputType.emailAddress,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 950),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 10,),
          


          // campo de senha
          TextInput(icone: "assets/images/password.png", placeholder: "Senha", controller: _senhaController, password: true,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1000),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 10,),



          SizedBox(
            width: double.infinity,
            child: Text(
              "Esqueci minha senha",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color.fromRGBO(84, 127, 255, 1),
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationColor: Color.fromRGBO(84, 127, 255, 1)
              ),
            ),
          ).animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1000),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),

          SizedBox(height: 40,),

          _erro != null ? MensagemErro(mensagem: _erro!) : SizedBox(),
          SizedBox(height: 10,),



          // botao continuar
          BotaoContinuar(comIcone: true, texto: "Entrar", funcao: () async {
            final NavigatorState nav = Navigator.of(context);
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            String email = _emailController.text.trim();
            String senha = _senhaController.text.trim();

            // verifica se os campos sao vazios ou se o email ou senha nao correspondem (MENSAGEM DE ERRO)
            if(email == "" || senha == ""){
              setState(() {
                _erro = "Campos vazios";
              });
              return;
            }


            // chamar login do usuario 
            // logar
            prefs.setBool("logado", true);

            // PARA FIM DE TESTE
            // prefs.setBool("logadoPro", true); 
            // prefs.setBool("temAgenda", false);

            // mandar para tela inicial, agora logado
            setState(() {
              _erro = null;
            });
            nav.pushNamed("/");
          })
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1050),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
        ],
      ),
    );
  }
  
}
