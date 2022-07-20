import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  final _frases = [
    'Que o dia comece bem e termine ainda melhor.',
    'Pra hoje: sorrisos bobos, uma mente tranquila e um coração cheio de paz.',
    'Às vezes as coisas demoram, mas acontecem.',
    'Imagine uma nova história para a sua vida e acredite nela.',
    'Nem todos os dias são bons, mas há algo bom em cada dia.',
    'Sorria! Deus acaba de te dar um novo dia e coisas extraordinárias podem acontecer se você acreditar.',
    'Levanta, sacode a poeira e dá a volta por cima.',
    'Um pequeno pensamento positivo pela manhã pode mudar todo o seu dia.',
  ];

  var _fraseGerada = 'Clique abaixo para gerar uma Frase!';

  void _gerarFrase() {
    // Recupera um numero random dentro do tamanho do array
    var fraseSorteada = Random().nextInt(_frases.length);
    // é o innerHTML, que passa a frase para a var _fraseGerada
    setState(() {
      _fraseGerada = _frases[fraseSorteada];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Frases do Dog'),
      ),
      body: Center(
        // Centraliza todo conteúdo do app
        child: Container(
          // Cria o Container que terá os widget
          padding:
              const EdgeInsets.all(16), // Adiciona padding em todas margens
          // width: double.infinity, // Faz o container centrarlizar o conteudo
          // Cria uma coluna
          child: Column(
              // alinha os elementos dentro da Coluna com espaçamento iguais
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // Alinha os elementos no centro da Coluna
              crossAxisAlignment: CrossAxisAlignment.center,
              // uma lista de Widgets que serão filhos da coluna
              children: [
                // Puxa imagen da pasta assets, configurada no pubspec.yaml
                Image.asset('assets/logo.jpg'),
                // Adiciona um texto embaixo da foto
                Text(
                  _fraseGerada,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
                // Cria um botão
                ElevatedButton(
                  // Adiciona estilos ao botão
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  // Evento de click, cria uma função vazia e não faz nada
                  onPressed: _gerarFrase,
                  // cria o texto filho do botão
                  child: const Text(
                    'Nova Frase',
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
