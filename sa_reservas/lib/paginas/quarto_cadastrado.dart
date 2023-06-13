import 'package:flutter/material.dart';

class QuartoCadastrado extends StatefulWidget {
  const QuartoCadastrado({super.key});

  @override
  State<QuartoCadastrado> createState() => _QuartoCadastradoState();
}

class _QuartoCadastradoState extends State<QuartoCadastrado> {
  @override
  Widget build(BuildContext context) {
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
                  child: Text("Quarto cadastrado com sucesso!",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}