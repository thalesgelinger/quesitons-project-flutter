import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int finalScore;
  final void Function() reset;

  Resultado(this.finalScore, this.reset);

  String get resultPhrase {
    if (finalScore < 8) {
      return 'Parabéns';
    } else if (finalScore < 12) {
      return 'Você é bom';
    } else if (finalScore < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Parabéns',
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: reset,
          child: Text(
            "Reiniciar?",
            style: TextStyle(
              color: Colors.blue[100],
            ),
          ),
        )
      ],
    );
  }
}
