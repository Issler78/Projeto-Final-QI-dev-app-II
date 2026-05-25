import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:decimal/decimal.dart';
import 'package:pulsetime/pages/cadastro.dart';
import 'package:pulsetime/widgets/buttons/botao_continuar.dart';
import 'package:pulsetime/widgets/inputs/date_input.dart';
import 'package:pulsetime/widgets/inputs/select_input.dart';
import 'package:pulsetime/widgets/inputs/text_input.dart';
import 'package:pulsetime/widgets/mensagem_erro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormCad1 extends StatefulWidget {
  const FormCad1({super.key});
  
  @override
  State<FormCad1> createState() => _FormCad1State();
}

class _FormCad1State extends State<FormCad1>{
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  String ?_valorS;
  String ?_erro;



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
          TextInput(icone: "assets/images/Sample_User_Icon.png", placeholder: "Nome completo", controller: _nomeController,)
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
          TextInput(icone: "assets/images/email.webp", placeholder: "E-mail", keyboardType: TextInputType.emailAddress, controller: _emailController,)
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
          TextInput(icone: "assets/images/tel.png", placeholder: "Telefone", keyboardType: TextInputType.phone, mask: _maskTel(), controller: _telController,)
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
            icone: "assets/images/Sample_User_Icon.png",
            placeholder: "Sexo", 
            items: ["Masculino", "Feminino"],
            value: _valorS, 
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
          SizedBox(height: 30,),


          // se _erro for diferente que null, mostra um erro na tela
          _erro != null ? MensagemErro(mensagem: _erro!) : SizedBox(),
          SizedBox(height: 10,),
          

          // botao continuar
          BotaoContinuar(comIcone: true, texto: "Continuar", funcao: () {
            String nome = _nomeController.text.trim();
            String email = _emailController.text.trim();
            String telefone = _telController.text.trim();
            String dataNasc = _dataController.text.trim();
            final sexo = _valorS == null || _valorS == "" ? null : _valorS!.trim();

            // erro de campos vazios
            if(nome == "" || email == "" || telefone == "" || dataNasc == "" || sexo == null){
              setState(() {
                _erro = "Campos vazios";
              });
              return;
            }

            // erro de email invalido (verificacao simples)
            if(!email.contains("@")){
              setState(() {
                _erro = "Insira um email válido";
              });
              return;
            }

            // erro de numero de telefone invalido 
            if(telefone.length != 15){
              setState(() {
                _erro = "Insira um número de telefone válido";
              });
              return;
            }



            // ir para proxima etapa do cadastro
            setState(() {
              _erro = null;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cadastro2(nome: nome, email: email, telefone: telefone, dataNasc: dataNasc,sexo: sexo)
              ) 
            );
            

          })
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1250),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
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



class FormCad2 extends StatefulWidget {
  final String nome;
  final String email;
  final String telefone;
  final String dataNasc;
  final String sexo;

  const FormCad2({super.key, required this.nome, required this.email, required this.telefone, required this.dataNasc, required this.sexo});

  @override
  State<FormCad2> createState() {
    return _FormCad2State();
  }
}

class _FormCad2State extends State<FormCad2>{
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confSenhaController = TextEditingController();
  String ?_erro;

  @override
  void dispose() {
    _cpfController.dispose();
    _senhaController.dispose();
    _confSenhaController.dispose();
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
          
          // campo de cpf
          TextInput(icone: "assets/images/doc.png", placeholder: "Cpf", controller: _cpfController, mask: _maskCpf(), keyboardType: TextInputType.phone,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1000),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),
          


          // campo de senha
          TextInput(icone: "assets/images/password.png", placeholder: "Senha", controller: _senhaController, password: true,)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1050),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),



          // campo de confirme sua senha
          TextInput(icone: "assets/images/password.png", placeholder: "Confirme sua senha", controller: _confSenhaController, password: true)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1100),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 30,),
          

          // mensagem de erro
          _erro != null ? MensagemErro(mensagem: _erro!) : SizedBox(),
          SizedBox(height: 10,),

          // botao continuar
          BotaoContinuar(comIcone: true, texto: "Cadastrar", funcao: () {
            String cpf = _cpfController.text.trim();
            String senha = _senhaController.text.trim();
            String confSenha = _confSenhaController.text.trim();

            // verifica se os campos sao vazios
            if(cpf == "" || senha == "" || confSenha == ""){
              setState(() {
                _erro = "Campos vazios";
              });
              return;
            } 
            
            // verifica se o cpf é valido
            if(cpf.length != 14){
              setState(() {
                _erro = "Insira um CPF válido";
              });
              return;
            }

            // verifica se a senha tem pelomenos 6 caracteres
            if(senha.length < 6) {
              setState(() {
                _erro = "A senha deve ter pelo menos 6 caracteres.";
              });
              return;
            }

            // verifica se as senhas correspondem
            if(confSenha != senha) {
              setState(() {
                _erro = "O campo 'Confirme sua senha' não corresponde ao campo 'Senha'";
              });
              return;
            }


            // ir para proxima etapa do cadastro
            setState(() {
              _erro = null;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cadastro3(nome: super.widget.nome, email: super.widget.email, telefone: super.widget.telefone, dataNasc: super.widget.dataNasc, sexo: super.widget.sexo, cpf: cpf, senha: senha,)
              ) 
            );

          })
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1250),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
        ],
      ),
    );
  }



  MaskTextInputFormatter _maskCpf(){
    // mascara para o campo de telefone
    return MaskTextInputFormatter(
      mask: '###.###.###-##', 
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy,
    );
  }
}



class FormCadProfissional extends StatefulWidget {
  const FormCadProfissional({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormCadProfissionalState();
  }
  
}

class _FormCadProfissionalState extends State<FormCadProfissional>{
  // é preciso recuperar aqui o id do usuario logado futuramente para a conclusao desse form

  // recuperar aqui as profissoes e locais salvos no banco de dados
  List<String> especialidades = [
    "Nutricionista",
    "Pediatra",
    "Clínico Geral",
    "Psicólogo",
    "Dentista",
    "Dermatologista",
    "Oftalmologista",
    "Fisioterapeuta",
    "Ginecologista",
  ];
  final locais = ["Amor Saúde", "Sáude Para Todos", "Bem Viver", "SoluMedi"];

  final TextEditingController _conselhoController = TextEditingController();
  final TextEditingController _valorConsultaController = TextEditingController();
  String ?_valorProfissao;
  String ?_valorLocal;
  String ?_erro;



  @override
  void dispose() {
    _conselhoController.dispose();
    _valorConsultaController.dispose();
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
          
          // campo de profissao
          SelectInput(
            icone: "assets/images/Sample_User_Icon.png",
            placeholder: "Especialidade",
            items: especialidades,
            value: _valorProfissao,
            funcao: (String ?value) {
              setState(() {
                _valorProfissao = value;
              });
            },
          )
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1000),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),
          


          // campo de codigo/numero do conselho
          TextInput(icone: "assets/images/doc.png", placeholder: "N° do conselho", controller: _conselhoController, mask: _maskCod(),)
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1050),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
          SizedBox(height: 20,),



          // campo de local
          SelectInput(
            icone: "assets/images/loc.png",
            placeholder: "Local de atendimento",
            items: locais,
            value: _valorLocal,
            funcao: (String ?value) {
              setState(() {
                _valorLocal = value;
              });
            },
          )
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1100),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),

          SizedBox(height: 20,),



          // campo de preco da consulta
          TextInput(
            icone: "assets/images/coins.png",
            placeholder: "Valor da consulta",
            keyboardType: TextInputType.number,
            mask: _maskPreco(),
            controller: _valorConsultaController,
          ).animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1150),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),



          SizedBox(height: 30,),



          _erro != null ? MensagemErro(mensagem: _erro!) : SizedBox(),
          SizedBox(height: 10,),
          

          // botao continuar
          BotaoContinuar(comIcone: true, texto: "Cadastrar", funcao: () async {
            
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            // campos do formulario
            final String ?profissao = _valorProfissao == null || _valorProfissao == "" ? null : _valorProfissao!.trim();
            final String cod = _conselhoController.text.trim();
            final String ?local = _valorLocal == null || _valorLocal == "" ? null : _valorLocal!.trim();
            final String precoConsulta = _valorConsultaController.text.trim();

            // verifica se os campos sao vazios
            if (
                profissao == null ||
                cod == "" ||
                local == null ||
                precoConsulta == ""
              ) {

              setState(() {
                _erro = "Campos vazios";
              });
              
              return;
            }

            // verifica o codigo
            if (cod.length != 10) {
              setState(() {
                _erro = "Insira um código/número de conselho válido";
              });
              return;
            }

            // verificar se o preco é maior que 1
            final preco = Decimal.parse(precoConsulta.split(" ")[1]);
            if (preco < Decimal.one) {
              setState(() {
                _erro = "O preço mínimo é R\$1.00";
              });
              return;
            }



            // chamar cadastro de profissional!!!
            prefs.setBool("logadoPro", true);
            prefs.setBool("temAgenda", false);



            setState(() {
              _erro = null;
            });

            // mandar para tela inicial, agora logado
            if (_erro == null) {
              Navigator.pushNamed(context, "/");
            }

          })
          .animate()
          .slideY(
            duration: Duration(milliseconds: 900),
            begin: -0.5,
            curve: Curves.easeOut,
            delay: Duration(milliseconds: 1250),
          )
          .fadeIn(duration: Duration(milliseconds: 1500)),
        ],
      ),
    );
  }

  MaskTextInputFormatter _maskCod(){
    // mascara para o campo de codigo/numero do conselho
    return MaskTextInputFormatter(
      mask: '#####/####', 
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy,
    );
  }

  CurrencyInputFormatter _maskPreco(){
    return CurrencyInputFormatter(
      leadingSymbol: 'R\$',
      useSymbolPadding: true,
    );
  }
  
}