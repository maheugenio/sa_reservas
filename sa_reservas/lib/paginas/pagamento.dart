import 'package:flutter/material.dart';

import '../componentes/botao.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({Key? key}) : super(key: key);

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  String metodoPagamento = '';
  TextEditingController numeroCartaoController = TextEditingController();

  @override
  void dispose() {
    numeroCartaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    efetuarReserva() {
      Navigator.of(context).pushNamed('/reservaEfetuada');
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
                  "PAGAMENTO",
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          
                        ),            
                        Text(
                          'Dados da compra',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink
                          ),
                        ),            
                        Text(
                          'Nome: Rosa Silvano',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Telefone: (48)98786-1235',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Endereço: Rua Silva Burigo, Tubarão, 312',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Quarto Standard - R\$300,00/diária',
                          style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '5 diárias - R\$1500,00',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Desconto: 30%',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total: R\$1050,00',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '',
                          
                        ),                        
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'https://cdn.discordapp.com/attachments/828645815412064348/1118267851325849600/194920-tipos-de-quarto-de-hotel-como-escolher-o-melhor-na-sua-hospedagem-1.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      const Text(
                        "Selecione o método de pagamento:",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text('Crédito'),
                              leading: Radio(
                                value: 'Crédito',
                                groupValue: metodoPagamento,
                                onChanged: (value) {
                                  setState(() {
                                    metodoPagamento = value.toString();
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Débito'),
                              leading: Radio(
                                value: 'Débito',
                                groupValue: metodoPagamento,
                                onChanged: (value) {
                                  setState(() {
                                    metodoPagamento = value.toString();
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Boleto'),
                              leading: Radio(
                                value: 'Boleto',
                                groupValue: metodoPagamento,
                                onChanged: (value) {
                                  setState(() {
                                    metodoPagamento = value.toString();
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Pix'),
                              leading: Radio(
                                value: 'Pix',
                                groupValue: metodoPagamento,
                                onChanged: (value) {
                                  setState(() {
                                    metodoPagamento = value.toString();
                                  });
                                },
                              ),
                            ),
                            if (metodoPagamento == 'Crédito' || metodoPagamento == 'Débito')
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: numeroCartaoController,
                                  decoration: const InputDecoration(
                                    labelText: 'Número do Cartão',
                                  ),
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
            botao(
              texto: 'Efetuar reserva',
              funcao: efetuarReserva,
            ),
          ],
        ),
      ),
    );
  }
}