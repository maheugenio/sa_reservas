import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../componentes/botao.dart';
import '../../componentes/caixa_texto.dart';

class CadQuarto extends StatefulWidget {
  const CadQuarto({super.key});

  @override
  State<CadQuarto> createState() => _CadQuartoState();
}

class _CadQuartoState extends State<CadQuarto> {

  final txtNumero = TextEditingController();
  final txtValor = TextEditingController();
  final txtDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {

    cadastraQuarto() {
      Navigator.of(context).pushNamed('/quartoCadastrado');
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
                  child: Text("QUARTOS",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ),
            Text('Cadastro de quarto', style: TextStyle(fontSize: 18)),
              caixaTexto(
                texto: 'Número', 
                msgValidacao: 'Informe o número: ',
                controlador: txtNumero,
                isSenha: false,
              ),
              caixaTexto(
                texto: 'Valor', 
                msgValidacao: 'Informe o valor: ',
                controlador: txtValor,
                isSenha: false,
              ),
              caixaTexto(
                texto: 'Descrição', 
                msgValidacao: 'Informe a descrição: ',
                controlador: txtDescricao,
                isSenha: false,
              ),
              botao(
                texto: 'Cadastrar', funcao: cadastraQuarto
              ),
          ],
        ),
      ),
    );
  }
}