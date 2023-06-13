import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../componentes/botao.dart';
import '../componentes/caixa_texto.dart';

class DispQuarto extends StatefulWidget {
  const DispQuarto({Key? key});

  @override
  State<DispQuarto> createState() => _DispQuartoState();
}

class _DispQuartoState extends State<DispQuarto> {
  DateTime? checkIn;
  DateTime? checkOut;

  Future<void> escolherDataCheckIn() async {
    final dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (dataEscolhida != null) {
      setState(() {
        checkIn = dataEscolhida;
      });
    }
  }

  Future<void> escolherDataCheckOut() async {
    final dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (dataEscolhida != null) {
      setState(() {
        checkOut = dataEscolhida;
      });
    }
  }

  bool datasSelecionadas() {
    return checkIn != null && checkOut != null;
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    verifDisponibilidade() {
      if (datasSelecionadas()) {
        Navigator.of(context).pushNamed('/reserva');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Datas não selecionadas'),
              content: Text('Por favor, selecione as datas de check-in e check-out.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ReservasMEM.com.br",
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 140, 1, 84),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "RESERVA",
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              'Selecione a data que deseja reservar',
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: escolherDataCheckIn,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Check-In 📅',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    color: Colors.pink[800],
                  ),
                ),
                Text(
                  'Check-In: ${checkIn != null ? dateFormat.format(checkIn!) : '-'}',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: escolherDataCheckOut,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Check-Out 📅',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    color: Colors.pink[800],
                  ),
                ),
                Text(
                  'Check-Out: ${checkOut != null ? dateFormat.format(checkOut!) : '-'}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            botao(
              texto: 'Verificar disponibilidade',
              funcao: verifDisponibilidade,
            ),
          ],
        ),
      ),
    );
  }
}