import 'package:flutter/material.dart';
import '../componentes/botao_habito.dart';

class Habito {
  String pergunta;
  bool? concluido;

  Habito({required this.pergunta, this.concluido});

  void marcar(bool valor) {
    concluido = valor;
  }
}

class Quiz extends StatefulWidget {
  final String? habitoAdicional;

  const Quiz({super.key, this.habitoAdicional});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late List<Habito> _habitos;

  @override
  void initState() {
    super.initState();

    _habitos = [
      Habito(pergunta: "Você bebeu água hoje?"),
      Habito(pergunta: "Você se exercitou hoje?"),
      Habito(pergunta: "Você estudou 1h hoje?"),
      Habito(pergunta: "Você está vivo por enquanto?"),
    ];

    if (widget.habitoAdicional != null &&
        widget.habitoAdicional!.trim().isNotEmpty) {
      _habitos.add(Habito(pergunta: widget.habitoAdicional!));
    }
  }

  void _marcarHabito(int index, bool valor) {
    setState(() {
      _habitos[index].marcar(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz2Go"),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: _habitos.length,
          itemBuilder: (context, index) {
            final habito = _habitos[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: habito.concluido == true
                    ? Colors.green[50]
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habito.pergunta,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _botaoHabito(habito, index, true, Colors.teal),
                        _botaoHabito(habito, index, false, Colors.redAccent),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        habito.concluido == null
                            ? "Opte por alguma opção"
                            : habito.concluido!
                                ? "✔️ Concluído"
                                : "❌ Não concluído",
                        style: TextStyle(
                          color: habito.concluido == null
                              ? Colors.redAccent
                              : habito.concluido!
                                  ? Colors.green
                                  : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _botaoHabito(Habito habito, int index, bool valor, Color cor) {
    final bool isSelecionado = habito.concluido == valor;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelecionado ? cor : cor.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 4,
      ),
      onPressed: () => _marcarHabito(index, valor),
      child: Text(
        valor ? "Sim" : "Não",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
