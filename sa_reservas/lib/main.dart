import 'package:flutter/material.dart';
import 'package:sa_reservas/paginas/area_adm.dart';
import 'package:sa_reservas/paginas/cad_quarto.dart';
import 'package:sa_reservas/paginas/login_adm.dart';
import 'package:sa_reservas/paginas/pagina_inicial.dart';
import 'package:sa_reservas/paginas/dispo_quarto.dart';
import 'package:sa_reservas/paginas/pagamento.dart';
import 'package:sa_reservas/paginas/quarto_cadastrado.dart';
import 'package:sa_reservas/paginas/relatorio.dart';
import 'package:sa_reservas/paginas/reserva.dart';
import 'package:sa_reservas/paginas/reserva_efetuada.dart';

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/pgInicial',
     routes: {
      '/pgInicial': (context) => PgInicial(),
      '/quarto': (context) => CadQuarto(),
      '/reserva': (context) => Reserva(),
       '/loginAdm': (context) => LoginAdm(),
       '/areaDoAdm': (context) => AreaDoAdm(),
       '/reservaEfetuada': (context) => ReservaEfetuada(),
       '/dispQuarto': (context) => DispQuarto(),
       '/pagamento': (context) => Pagamento(),
       '/relatorio': (context) => Relatorio(),
       '/quartoCadastrado': (context) => QuartoCadastrado()
      },
    );   
  }
}
