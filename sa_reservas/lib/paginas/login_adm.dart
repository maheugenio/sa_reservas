import 'package:flutter/material.dart';
import '../componentes/botao.dart';
import '../componentes/caixa_texto.dart';

class LoginAdm extends StatefulWidget {
  const LoginAdm({Key? key});

  @override
  State<LoginAdm> createState() => _PgLoginState();
}

class _PgLoginState extends State<LoginAdm> {
  final txtUsuario = TextEditingController();
  final txtSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fazLogin() {
      if (_formKey.currentState!.validate()) {
        if (txtUsuario.text == 'adm' && txtSenha.text == 'abc123') {
          Navigator.of(context).pushNamed('/areaDoAdm');
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Inválido'),
                content: Text('Usuário ou senha incorretos. Por favor, tente novamente.'),
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
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontSize: 30)),
            caixaTexto(
              texto: 'Usuário',
              msgValidacao: 'Informe o usuário: ',
              controlador: txtUsuario,
              isSenha: false,
            ),
            caixaTexto(
              texto: 'Senha',
              msgValidacao: 'Informe a senha: ',
              controlador: txtSenha,
              isSenha: true,
            ),
            botao(
              texto: 'OK',
              funcao: fazLogin,
            ),
          ],
        ),
      ),
    );
  }
}
