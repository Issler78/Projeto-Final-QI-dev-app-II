import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:pulsetime/pages/agendar_consulta.dart';

class ProfissionalWidget extends StatelessWidget {
  final String nome;
  final String profissao;
  final String cod;
  final String loc;
  final Decimal preco;
  final int id;

  const ProfissionalWidget({
    super.key,
    required this.id,
    required this.nome,
    required this.cod,
    required this.loc,
    required this.preco,
    required this.profissao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      height: 140,
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 400),
      margin: EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => EscolherDia(profissao: profissao, id: id, nome: nome, loc: loc, preco: preco)
            )
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // linha superior
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // foto perfil
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 15),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/doctor1.jpg",
                    width: 80,
                    height: 80,
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // nome
                            Text(
                              nome,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1,
                              ),
                            ),

                            // profissao
                            Text(
                              profissao,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1,
                              ),
                            ),

                            SizedBox(height: 15),

                            // preco
                            Text(
                              "A partir de",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Color.fromRGBO(94, 94, 94, 1),
                                fontSize: 14,
                                height: 1,
                              ),
                            ),
                            Text(
                              "R\$ ${preco.toStringAsFixed(2)}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 147, 22, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            // loc
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(79, 97, 162, .15),
                  ),
                  child: Image.asset(
                    "assets/images/loc.png",
                    width: 28,
                    height: 28,
                  ),
                ),
                Text(
                  loc,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromRGBO(94, 94, 94, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfissionalWidget2 extends StatelessWidget {
  final int id;
  final String nome;
  final String profissao;
  final String loc;
  final Decimal preco;

  const ProfissionalWidget2({
    super.key,
    required this.id,
    required this.nome,
    required this.loc,
    required this.preco,
    required this.profissao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(
          color: Color.fromRGBO(79, 97, 162, .15),
          width: 1.5,
        ),
      ),
      height: 100,
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 700),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            ),
          ),
        ),
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // linha superior
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // foto perfil
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 15),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/doctor1.jpg",
                    width: 80,
                    height: 80,
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // nome
                      Text(
                        nome,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1,
                        ),
                      ),

                      // profissao
                      Text(
                        profissao,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1,
                        ),
                      ),

                      SizedBox(height: 15),

                      //loc
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color.fromRGBO(79, 97, 162, .15),
                            ),
                            child: Image.asset(
                              "assets/images/loc.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                          Text(
                            loc,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromRGBO(94, 94, 94, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
