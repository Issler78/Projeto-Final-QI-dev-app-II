import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pulsetime/pages/cadastro.dart';
import 'package:pulsetime/widgets/botao_continuar.dart';
import 'package:pulsetime/widgets/inputs/date_input.dart';
import 'package:pulsetime/widgets/inputs/select_input.dart';
import 'package:pulsetime/widgets/inputs/text_input.dart';

class FormCad1 extends StatefulWidget {
  const FormCad1({super.key});
  
  @override
  State<FormCad1> createState() {
    return _FormCad1State();
  }
}

class _FormCad1State extends State<FormCad1>{
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  late String ?_valorS = "";

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telController.dispose();
    _dataController.dispose();
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
          
          // campo de nome
          TextInput(icon: "assets/images/Sample_User_Icon.png", placeholder: "Nome completo", controller: _nomeController,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1000),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),
          


          // campo de e-mail
          TextInput(icon: "assets/images/email.webp", placeholder: "E-mail", keyboardType: TextInputType.emailAddress, controller: _emailController,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1050),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),



          // campo de telefone
          TextInput(icon: "assets/images/tel.png", placeholder: "Telefone", keyboardType: TextInputType.phone, mask: _maskTel(), controller: _telController,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1100),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),


          
          // campo de data de nascimento
          DateInput(icon: "assets/images/calendar-249.png", placeholder: "Data de nascimento", controller: _dataController,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1150),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),



          // campo de escolha do sexo
          SelectInput(
            icon: "assets/images/Sample_User_Icon.png",
            placeholder: "Sexo", 
            items: ["Masculino", "Feminino"], 
            funcao: (String ?value) {
              setState(() {
                _valorS = value;
              });
            }
          )
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1200),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),

          

          // botao continuar
          BotaoContinuar(comIcone: true, texto: "Continuar", funcao: () {
            String nome = _nomeController.text.trim();
            String email= _emailController.text.trim();
            String telefone = _telController.text.trim();
            String dataNasc = _dataController.text.trim();
            final sexo = _valorS == null || _valorS == "" ? null : _valorS!.trim();

            if(nome == "" || email == "" || telefone == "" || dataNasc == "" || sexo == null){
              print("falta completar campos");
              return;
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cadastro2(nome: nome, email: email, telefone: telefone, dataNasc: dataNasc, sexo: sexo)
                ) 
              );
            }

          })
        ],
      ),
    );
  }



  MaskTextInputFormatter _maskTel(){
    // mascara para o campo de telefone
    return MaskTextInputFormatter(
      mask: '(##) #####-####', 
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy,
    );
  }
}