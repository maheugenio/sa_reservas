import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';

class AreaDoAdm extends StatefulWidget {
  const AreaDoAdm({super.key});

  @override
  State<AreaDoAdm> createState() => _AreaDoAdmState();
}

class _AreaDoAdmState extends State<AreaDoAdm> {
  @override
  Widget build(BuildContext context) {

    visualizarRelatorio() {
      Navigator.of(context).pushNamed('/relatorio');
    }
    cadastrarQuarto() {
      Navigator.of(context).pushNamed('/quarto');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Área do Administrador",
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
                  child: Text("Visualizar relatórios",
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold))),
            ),
            botao(
                texto: 'Relatórios', funcao: visualizarRelatorio
            ),           
            botao(
                texto: 'Cadastrar quarto', funcao: cadastrarQuarto
            ),
          ],
        ),
      ),
    );
  }
}