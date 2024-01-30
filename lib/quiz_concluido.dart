import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/home_page.dart';

class QuizConcluido extends StatelessWidget {
  final int pontuacao;
  const QuizConcluido({super.key, required this.pontuacao});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Voltar para página inicial',
              style: GoogleFonts.nunitoSans(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const HomePage())) 
          ),
        ),
        body:  Center(
          child: Text('Parabéns você concluiu o quiz! \nPontuação final: $pontuacao',style: GoogleFonts.roboto(fontWeight: FontWeight.bold , fontSize: 36), textAlign: TextAlign.center,)
    )
    );
  }
}

