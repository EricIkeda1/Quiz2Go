import 'package:flutter/material.dart';
import '../modelos/habito.dart';
import '../componentes/campo_habito.dart';
import '../componentes/botao_habito.dart';
import 'quiz.dart';

class AdicionarHabito extends StatefulWidget {
  const AdicionarHabito({super.key});

  @override
  State<AdicionarHabito> createState() => _AdicionarHabitoState();
}

class _AdicionarHabitoState extends State<AdicionarHabito> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  void salvarHabito() {
    if (nomeController.text.isEmpty) return;

    final novaPergunta = nomeController.text;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Quiz(
          habitoAdicional: novaPergunta,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Hábito'),
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CampoHabito(label: "Nome do Hábito", controller: nomeController),
            const SizedBox(height: 16),
            CampoHabito(
                label: "Descrição (opcional)", controller: descricaoController),
            const SizedBox(height: 24),
            BotaoHabito(texto: "Salvar Hábito", onPressed: salvarHabito),
          ],
        ),
      ),
    );
  }
}
