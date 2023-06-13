import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';

class PgInicial extends StatefulWidget {
  const PgInicial({super.key});

  @override
  State<PgInicial> createState() => _PgInicialState();
}

class _PgInicialState extends State<PgInicial> {
  @override
  Widget build(BuildContext context) {

    Reservar() {
      Navigator.of(context).pushNamed('/dispQuarto');
    }

    AreaDoAdm() {
      Navigator.of(context).pushNamed('/loginAdm');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ReservasMEM.com.br",
          style: const TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 140, 1, 84),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text("Olá!",
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold))),
            ),
            Text('Gostaria de reservar um quarto hoje?', style: TextStyle(fontSize: 30)),
            botao(
                texto: 'Reservar', funcao: Reservar
            ),
      
            botao(
                texto: 'Área do administrador', funcao: AreaDoAdm
            ),
          ],
        ),
      ),
    );
  }
}