import 'package:flutter/material.dart';

class Relatorio extends StatefulWidget {
  const Relatorio({Key? key}) : super(key: key);

  @override
  State<Relatorio> createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      'Reservas Canceladas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reservasCanceladas.length,
                        itemBuilder: (context, index) {
                          final reserva = reservasCanceladas[index];
                          return ListTile(
                            title: Text('Quarto ${reserva.numeroQuarto} - ${getTipoQuarto(reserva.numeroQuarto)}'),
                            subtitle: Text(
                                'Cliente: ${reserva.cliente}\nData de entrada: ${reserva.dataEntrada}\nData de saída: ${reserva.dataSaida}'),
                            onTap: () {
                              // Ação para visualizar mais detalhes da reserva cancelada
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      'Reservas Não Pagas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reservasNaoPagas.length,
                        itemBuilder: (context, index) {
                          final reserva = reservasNaoPagas[index];
                          return ListTile(
                            title: Text('Quarto ${reserva.numeroQuarto} - ${getTipoQuarto(reserva.numeroQuarto)}'),
                            subtitle: Text(
                                'Cliente: ${reserva.cliente}\nData de entrada: ${reserva.dataEntrada}\nData de saída: ${reserva.dataSaida}\nValor pendente: R\$ ${reserva.valorPendente.toStringAsFixed(2)}'),
                            onTap: () {
                              // Ação para visualizar mais detalhes da reserva não paga
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      'Reservas do Dia',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reservasDoDia.length,
                        itemBuilder: (context, index) {
                          final reserva = reservasDoDia[index];
                          return ListTile(
                            title: Text('Quarto ${reserva.numeroQuarto} - ${getTipoQuarto(reserva.numeroQuarto)}'),
                            subtitle: Text(
                                'Cliente: ${reserva.cliente}\nData de entrada: ${reserva.dataEntrada}\nData de saída: ${reserva.dataSaida}\nStatus de check-in: ${reserva.statusCheckIn}'),
                            onTap: () {
                              // Ação para visualizar mais detalhes da reserva do dia
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getTipoQuarto(int numeroQuarto) {
  switch (numeroQuarto) {
    case 1:
      return 'Quarto Standard';
    case 2:
      return 'Quarto Luxo';
    case 3:
      return 'Quarto Suíte Master';
    case 4:
      return 'Quarto Infantil';
    case 5:
      return 'Quarto Standard';
    case 6:
      return 'Quarto Luxo';
    case 7:
      return 'Quarto Suíte Master';
    case 8:
      return 'Quarto Infantil';
    default:
      return '-';
  }
}

class ReservaCancelada {
  final int numeroQuarto;
  final String cliente;
  final String dataEntrada;
  final String dataSaida;
  final String motivoCancelamento;

  ReservaCancelada({
    required this.numeroQuarto,
    required this.cliente,
    required this.dataEntrada,
    required this.dataSaida,
    required this.motivoCancelamento,
  });
}

class ReservaNaoPaga {
  final int numeroQuarto;
  final String cliente;
  final String dataEntrada;
  final String dataSaida;
  final double valorTotal;
  final double valorPendente;

  ReservaNaoPaga({
    required this.numeroQuarto,
    required this.cliente,
    required this.dataEntrada,
    required this.dataSaida,
    required this.valorTotal,
    required this.valorPendente,
  });
}

class ReservaDoDia {
  final int numeroQuarto;
  final String cliente;
  final String dataEntrada;
  final String dataSaida;
  final String statusCheckIn;

  ReservaDoDia({
    required this.numeroQuarto,
    required this.cliente,
    required this.dataEntrada,
    required this.dataSaida,
    required this.statusCheckIn,
  });
}

List<ReservaCancelada> reservasCanceladas = [
  ReservaCancelada(
    numeroQuarto: 1,
    cliente: 'Aurora',
    dataEntrada: '10/06/2023',
    dataSaida: '14/06/2023',
    motivoCancelamento: 'Mudança de planos',
  ),
  ReservaCancelada(
    numeroQuarto: 2,
    cliente: 'Marcos',
    dataEntrada: '11/06/2023',
    dataSaida: '19/06/2023',
    motivoCancelamento: 'Problemas de saúde',
  ),
];

List<ReservaNaoPaga> reservasNaoPagas = [
  ReservaNaoPaga(
    numeroQuarto: 3,
    cliente: 'Vanessa',
    dataEntrada: '20/06/2023',
    dataSaida: '24/06/2023',
    valorTotal: 1000.0,
    valorPendente: 100.0,
  ),
  ReservaNaoPaga(
    numeroQuarto: 4,
    cliente: 'Ana',
    dataEntrada: '21/06/2023',
    dataSaida: '23/06/2023',
    valorTotal: 700.0,
    valorPendente: 600.0,
  ),
];

List<ReservaDoDia> reservasDoDia = [

  ReservaDoDia(
    numeroQuarto: 5,
    cliente: 'Ricardo',
    dataEntrada: '13/06/2023',
    dataSaida: '15/06/2023',
    statusCheckIn: 'Pendente',
  ),
  ReservaDoDia(
    numeroQuarto: 6,
    cliente: 'Flávia',
    dataEntrada: '13/06/2023',
    dataSaida: '17/06/2023',
    statusCheckIn: 'Concluído',
  ),
  ReservaDoDia(
    numeroQuarto: 7,
    cliente: 'Ana',
    dataEntrada: '13/06/2023',
    dataSaida: '15/06/2023',
    statusCheckIn: 'Em andamento',
  ),
  ReservaDoDia(
    numeroQuarto: 8,
    cliente: 'Fábio',
    dataEntrada: '13/06/2023',
    dataSaida: '17/06/2023',
    statusCheckIn: 'Pendente',
  ),
];