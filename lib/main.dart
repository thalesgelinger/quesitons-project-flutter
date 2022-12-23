import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'text': "Qual é a sua cor favorita?",
      'respostas': [
        {'text': 'Presto', "score": 10},
        {'text': 'Vermelho', "score": 5},
        {'text': 'Verde', "score": 3},
        {'text': 'Branco', "score": 1},
      ]
    },
    {
      'text': "Qual é o seu animal favorita?",
      'respostas': [
        {'text': 'Coelho', "score": 10},
        {'text': 'Cobra', "score": 5},
        {'text': 'Elefante', "score": 3},
        {'text': 'Leao', "score": 1}
      ],
    },
    {
      'text': "Qual o seu insltrutor favorito",
      'respostas': [
        {'text': 'Leo', "score": 10},
        {'text': 'Maria', "score": 3},
        {'text': 'João', "score": 5},
        {'text': 'Pedro', "score": 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (hasQuestionSelected) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reset() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get hasQuestionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasQuestionSelected
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reset),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
