import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _optionImageCpu = const AssetImage("images/padrao.png");
  var _resultado = "";

  void _handleSelectOption(String option) {
    var options = ["pedra", "papel", "tesoura"];
    var randomNumber = Random().nextInt(options.length);
    var optionCPU = options[randomNumber];

    switch (optionCPU) {
      case "pedra":
        setState(() {
          _optionImageCpu = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _optionImageCpu = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _optionImageCpu = const AssetImage("images/tesoura.png");
        });
        break;
    }

    if (option == "pedra" && optionCPU == "papel") {
      setState(() {
        _resultado = "Perdeu";
      });
      return;
    }

    if (option == "tesoura" && optionCPU == "pedra") {
      setState(() {
        _resultado = "Perdeu";
      });
      return;
    }

    if (option == "papel" && optionCPU == "tesoura") {
      setState(() {
        _resultado = "Perdeu";
      });
      return;
    }

    if (option == optionCPU) {
      setState(() {
        _resultado = "Empatou";
      });
      return;
    }

    setState(() {
        _resultado = "Ganhou";
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JokenPo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Escolha do App"),
              Image(image: _optionImageCpu, width: 150, height: 150),
              Text(_resultado),
              const SizedBox(height: 20), // Espaçamento vertical
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset("images/papel.png", width: 100),
                    onTap: () {
                      _handleSelectOption("papel");
                    },
                  ),
                  GestureDetector(
                    child: Image.asset("images/pedra.png", width: 100),
                    onTap: () {
                      _handleSelectOption("pedra");
                    },
                  ),
                  GestureDetector(
                    child: Image.asset("images/tesoura.png", width: 100),
                    onTap: () {
                      _handleSelectOption("tesoura");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
