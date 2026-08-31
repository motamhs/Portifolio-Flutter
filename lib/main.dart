import 'package:flutter/material.dart';
import 'package:portifolio/models/projeto.dart';
import 'package:portifolio/pages/tela_principal.dart';
import 'package:portifolio/pages/tela_projeto.dart';
import 'package:portifolio/pages/tela_tecnologias.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Portfólio',
      initialRoute: "/",
      routes: {
        "/": (context) => const TelaPrincipal(),
        "/tecnologias": (context) => const TelaTecnologias(),
        "/projeto1": (context) => TelaProjeto(projeto: projetos[0]),
        "/projeto2": (context) => TelaProjeto(projeto: projetos[1]),
        "/projeto3": (context) => TelaProjeto(projeto: projetos[2]),
      },
    );
  }
}
