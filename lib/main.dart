import 'package:flutter/material.dart';
import 'paginas/home.dart';

void main() {
  runApp(const DiarioHabitos());
}

class DiarioHabitos extends StatelessWidget {
  const DiarioHabitos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz de Hábitos',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const Home(),
    );
  }
}
