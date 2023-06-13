import 'package:flutter/material.dart';
import '../componentes/botao.dart';
import '../componentes/caixa_texto.dart';

class Reserva extends StatefulWidget {
  const Reserva({Key? key}) : super(key: key);

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  final txtNome = TextEditingController();
  final txtTelefone = TextEditingController();
  final txtRua = TextEditingController();
  final txtBairro = TextEditingController();
  final txtCidade = TextEditingController();
  final txtNumero = TextEditingController();
  final txtCupom = TextEditingController();

  List<Quarto> quartos = [
    Quarto(
      descricao: 'Quarto Luxo',
      valor: 'R\$ 500,00/diária',
    ),
    Quarto(
      descricao: 'Quarto Standard',
      valor: 'R\$ 300,00/diária',
    ),
  ];

  Quarto? quartoSelecionado;
  bool possuiCupom = false;

  bool camposPreenchidos() {
    return txtNome.text.isNotEmpty &&
        txtTelefone.text.isNotEmpty &&
        txtRua.text.isNotEmpty &&
        txtBairro.text.isNotEmpty &&
        txtCidade.text.isNotEmpty &&
        txtNumero.text.isNotEmpty;
  }

  bool validarTelefone(String telefone) {
    RegExp regex = RegExp(r'^\([1-9]{2}\)[9]{1}[0-9]{4}-[0-9]{4}$');
    return regex.hasMatch(telefone);
  }

  bool validarNumeroResidencia(String numero) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(numero);
  }

  @override
  Widget build(BuildContext context) {

  efetuarPagamento() {
    if (quartoSelecionado == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quarto não selecionado'),
            content: Text('Por favor, escolha um quarto antes de efetuar a reserva.'),
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
      return;
    }

    if (camposPreenchidos()) {
      if (validarTelefone(txtTelefone.text) && validarNumeroResidencia(txtNumero.text)) {
        if (possuiCupom && txtCupom.text != 'MEM123') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Cupom inválido'),
                content: Text('O cupom de desconto informado é inválido. Por favor, verifique e tente novamente.'),
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
          return;
        }
        Navigator.of(context).pushNamed('/pagamento');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Dados inválidos'),
              content: Text('Por favor, verifique o número de telefone e o número da residência.'),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Campos vazios'),
            content: Text('Por favor, preencha todos os campos antes de efetuar a reserva.'),
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
              'Escolha um quarto disponível:',
              style: const TextStyle(fontSize: 20),
            ),
            DropdownButton<Quarto>(
              value: quartoSelecionado,
              onChanged: (Quarto? valor) {
                setState(() {
                  quartoSelecionado = valor;
                });
              },
              items: quartos.map((Quarto quarto) {
                return DropdownMenuItem<Quarto>(
                  value: quarto,
                  child: Text(quarto.descricao),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            if (quartoSelecionado != null) ...[
              Text(
                'Descrição: ${quartoSelecionado!.descricao}',
                style: const TextStyle(color: Color.fromARGB(255, 231, 18, 89), fontSize: 15),
              ),
              Text(
                'Valor: ${quartoSelecionado!.valor}',
                style: const TextStyle(color: Color.fromARGB(255, 231, 18, 89), fontSize: 15),
              ),
            ],
            SizedBox(height: 10),
            Text(
                'Não há frigobar e nem serviço de quarto.',
                style: const TextStyle(color: Color.fromARGB(255, 77, 77, 77), fontSize: 16),
              ),
            SizedBox(height: 10),
            Text(
              'Preencha seus dados!',
              style: const TextStyle(fontSize: 20),
            ),
            caixaTexto(
              texto: 'Nome',
              msgValidacao: 'Informe seu nome: ',
              controlador: txtNome,
              isSenha: false,
            ),
            caixaTexto(
              texto: 'Telefone: (xx)9xxxx-xxxx',
              msgValidacao: 'Informe o seu telefone com DDD: ',
              controlador: txtTelefone,
              isSenha: false,
            ),
            Text(
              'Endereço',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                Expanded(
                  child: caixaTexto(
                    texto: 'Rua',
                    msgValidacao: 'Informe sua rua: ',
                    controlador: txtRua,
                    isSenha: false,
                  ),
                ),
                Expanded(
                  child: caixaTexto(
                    texto: 'Bairro',
                    msgValidacao: 'Informe seu bairro: ',
                    controlador: txtBairro,
                    isSenha: false,
                  ),
                ),
                Expanded(
                  child: caixaTexto(
                    texto: 'Cidade',
                    msgValidacao: 'Informe sua cidade: ',
                    controlador: txtCidade,
                    isSenha: false,
                  ),
                ),
                Expanded(
                  child: caixaTexto(
                    texto: 'Número',
                    msgValidacao: 'Informe o número da residência: ',
                    controlador: txtNumero,
                    isSenha: false,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Possui cupom de desconto? ',
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButton<bool>(
                  value: possuiCupom,
                  onChanged: (bool? valor) {
                    setState(() {
                      possuiCupom = valor!;
                    });
                  },
                  items: [
                    DropdownMenuItem<bool>(
                      value: false,
                      child: Text('Não'),
                    ),
                    DropdownMenuItem<bool>(
                      value: true,
                      child: Text('Sim'),
                    ),
                  ],
                ),
              ],
            ),
            if (possuiCupom) ...[
              caixaTexto(
                texto: 'Cupom de desconto',
                msgValidacao: 'Informe o cupom de desconto: ',
                controlador: txtCupom,
                isSenha: false,
              ),
            ],
            botao(texto: 'Efetuar pagamento', funcao: efetuarPagamento),
          ],
        ),
      ),
    );
  }
}

class Quarto {
  final String descricao;
  final String valor;

  Quarto({
    required this.descricao,
    required this.valor,
  });
}