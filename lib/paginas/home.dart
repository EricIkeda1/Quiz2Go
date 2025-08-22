import 'package:flutter/material.dart';
import 'quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diário de Hábitos"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Quiz()),
            );
          },
          child: const Text(
            "Começar Quiz de Hábitos",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
