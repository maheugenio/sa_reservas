import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class caixaTexto extends StatefulWidget {

  final controlador;
  final msgValidacao;
  final texto;
  final isSenha;

  const caixaTexto({
    this.controlador, 
    this.msgValidacao, 
    this.texto, 
    this.isSenha, 
  });

  @override
  State<caixaTexto> createState() => _caixaTextoState();
}

class _caixaTextoState extends State<caixaTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: widget.controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.msgValidacao;
          }
        },
        obscureText: widget.isSenha,
        decoration: InputDecoration(
          labelText: widget.texto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
        ),
      ),
    );
  }
}