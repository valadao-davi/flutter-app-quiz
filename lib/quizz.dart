import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/quiz_concluido.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isCorrect;
  int pontuacao = 0;
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'Qual destes animais é conhecido por sua impressionante capacidade de mudar de cor?',
      'answers': ['Golfinho', 'Polvo', 'Tubarão', 'Baleia'],
      'correctAnswer': 'Polvo'
    },
    {
      'question':
          'Qual animal marinho é famoso por sua carapaça dura e longa vida?',
      'answers': [
        'Baleia Azul',
        'Caranguejo',
        'Tartaruga Marinha',
        'Estrela do Mar'
      ],
      'correctAnswer': 'Tartaruga Marinha'
    }
  ];

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      
    }
  }

  void handleAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isCorrect = answer == questions[currentQuestionIndex]['correctAnswer'];
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        selectedAnswer = null;
        isCorrect = null;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => QuizConcluido(pontuacao: pontuacao)));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
        appBar: AppBar(
            title: Text('Quiz marítmo!',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold))),
        body: Column(
          children: [
            Container(
              color: Colors.deepPurple[50],
              width: double.infinity,
              height: 400,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    currentQuestion['question'],
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            Wrap(
              children: currentQuestion['answers'].map<Widget>((Resposta) {
                bool isSelected = selectedAnswer == Resposta;
                Color? buttonColor;
                if (isSelected) {
                  buttonColor = isCorrect! ? Colors.green : Colors.red;
                  isCorrect! ? pontuacao = pontuacao + 750 : print('nada');
                }
                return meuBtn(
                    Resposta, () => handleAnswer(Resposta), buttonColor);
              }).toList(),
            )
          ],
        ));
  }
}

Widget meuBtn(String Resposta, VoidCallback onPressed, Color? color) =>
    Container(
      margin: const EdgeInsets.all(16),
      width: 160,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(Resposta),
      ),
    );
