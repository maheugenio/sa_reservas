import 'package:flutter/material.dart';

class ReservaEfetuada extends StatefulWidget {
  const ReservaEfetuada({super.key});

  @override
  State<ReservaEfetuada> createState() => _ReservaEfetuadaState();
}

class _ReservaEfetuadaState extends State<ReservaEfetuada> {
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
                  child: Text("OBRIGADA PELA PREFERÊNCIA!",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ),
            Text('Reserva efetuada com sucesso!!', style: TextStyle(fontSize: 18)),
            Text('Qualquer dúvida estaremos a disposição em nosso Whatsapp!', style: TextStyle(fontSize: 18)),
            Text('((48)98789-7132)', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}