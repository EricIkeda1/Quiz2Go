import 'package:flutter/material.dart';
import '../modelos/habito.dart';
import '../componentes/botao_habito.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Habito> _habitos = [
    Habito(pergunta: "Você bebeu água hoje?"),
    Habito(pergunta: "Você se exercitou hoje?"),
    Habito(pergunta: "Você estudou 1h hoje?"),
  ];

  void _marcarHabito(int index, bool valor) {
    setState(() {
      _habitos[index].marcar(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz de Hábitos"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _habitos.length,
        itemBuilder: (context, index) {
          final habito = _habitos[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    habito.pergunta,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      BotaoHabito(
                        texto: "Sim",
                        onPressed: () => _marcarHabito(index, true),
                      ),
                      BotaoHabito(
                        texto: "Não",
                        onPressed: () => _marcarHabito(index, false),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (habito.concluido)
                    const Text(
                      "✔️ Marcado como concluído",
                      style: TextStyle(color: Colors.green),
                    )
                  else
                    const Text(
                      "❌ Não concluído",
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
