import 'package:flutter/material.dart';
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

  void salvarHabito() {
    if (nomeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Digite um nome para o hábito!"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text(
          'Novo Hábito',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.add_task,
                        size: 80, color: Colors.teal),
                    const SizedBox(height: 16),
                    const Text(
                      "Adicionar Hábito",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CampoHabito(
                      label: "Nome do Hábito",
                      controller: nomeController,
                    ),
                    const SizedBox(height: 32),
                    BotaoHabito(
                      texto: "Salvar Hábito",
                      onPressed: salvarHabito,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
