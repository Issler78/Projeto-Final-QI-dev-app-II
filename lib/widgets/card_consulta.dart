import 'package:flutter/material.dart';



class ConsultaCard extends StatelessWidget {
  final String nome;
  final String profissao;
  final String cod;
  final String local;
  final String preco;
  final String data;
  final String diaSemana;
  final String horario;
  final VoidCallback funcaoCancelar;

  const ConsultaCard({
    super.key, 
    required this.nome,
    required this.profissao,
    required this.cod,
    required this.local,
    required this.preco,
    required this.data,
    required this.horario, 
    required this.diaSemana, 
    required this.funcaoCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // cabeçalho com foto, nome e profissao
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(94, 94, 94, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/doctor1.jpg',
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    '$profissao · $cod',
                    style: TextStyle(
                      color: Color.fromRGBO(11, 180, 255, 1),
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),

          // divisoria
          Divider(),

          SizedBox(height: 10),

          // infos da consulta: data, horário, local e valor
          _InfoRow(
            imagem: 'assets/images/calendar-249.png',
            label: 'Data',
            valor: "$data · $diaSemana",
          ),
          SizedBox(height: 10),
          _InfoRow(
            imagem: 'assets/images/clockpng.png',
            label: 'Horário',
            valor: horario,
          ),
          SizedBox(height: 10),
          _InfoRow(
            imagem: 'assets/images/loc.png',
            label: 'Local',
            valor: local,
          ),
          SizedBox(height: 10),
          _InfoRow(
            imagem: 'assets/images/coins.png',
            label: 'Valor',
            valor: preco,
            corValor: Color.fromRGBO(0, 147, 22, 1),
          ),

          SizedBox(height: 15),

          // botoes de acoes
          Row(
            children: [
              Expanded(
                child: _BotaoAcao(
                  texto: 'Cancelar',
                  corTexto: Color.fromRGBO(200, 0, 0, 1),
                  corBorda: Color.fromRGBO(200, 0, 0, .35),
                  corFundo: Color.fromRGBO(200, 0, 0, .07),
                  onTap: funcaoCancelar,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _BotaoAcao(
                  texto: 'Reagendar',
                  corTexto: Colors.white,
                  corBorda: Colors.transparent,
                  corFundo: Color.fromRGBO(0, 147, 22, 1),
                  onTap: () {
                    // CHAMAR O BACK END PARA REAGENDAR UMA CONSULTA AQUI!!!

                    Navigator.pushReplacementNamed(context, '/minhas_consultas');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// linha de informação reutilizável com ícone, label e valor
class _InfoRow extends StatelessWidget {
  final String imagem;
  final String label;
  final String valor;
  final Color? corValor;

  const _InfoRow({
    required this.imagem,
    required this.label,
    required this.valor,
    this.corValor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icone
        Container(
          width: 36,
          height: 36,
          margin: EdgeInsets.only(right: 10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color.fromRGBO(79, 97, 162, .15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imagem,
            width: 36,
            height: 36,
          ),
        ),

        // texto de cima
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Color.fromRGBO(94, 94, 94, 1),
                fontSize: 12,
              ),
            ),

            // texto de baixo
            Text(
              valor,
              style: TextStyle(
                color: corValor ?? Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// botao de acao dos cards (cancelar e reagendar)
class _BotaoAcao extends StatelessWidget {
  final String texto;
  final Color corTexto;
  final Color corBorda;
  final Color corFundo;
  final VoidCallback onTap;

  const _BotaoAcao({
    required this.texto,
    required this.corTexto,
    required this.corBorda,
    required this.corFundo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: corFundo,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: corBorda, width: 1.2),
        ),
        alignment: Alignment.center,
        child: Text(
          texto,
          style: TextStyle(
            color: corTexto,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}