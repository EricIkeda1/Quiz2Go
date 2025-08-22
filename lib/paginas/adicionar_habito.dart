import 'package:flutter/material.dart';
import '../componentes/campo_habito.dart';
import '../componentes/botao_habito.dart';
import '../modelos/habito.dart';

class AdicionarHabito extends StatefulWidget {
  const AdicionarHabito({super.key});

  @override
  State<AdicionarHabito> createState() => _AdicionarHabitoState();
}

class _AdicionarHabitoState extends State<AdicionarHabito> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  final List<Habito> habitos = [];

  void salvarHabito() {
    if (nomeController.text.isEmpty) return;

    final novoHabito = Habito(
      nome: nomeController.text,
      descricao: descricaoController.text,
    );

    setState(() {
      habitos.add(novoHabito);
      nomeController.clear();
      descricaoController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Hábito adicionado!')),
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
            CampoHabito(label: "Descrição (opcional)", controller: descricaoController),
            const SizedBox(height: 24),
            BotaoHabito(texto: "Salvar Hábito", onPressed: salvarHabito),
            const SizedBox(height: 24),
            Expanded(
              child: habitos.isEmpty
                  ? const Center(child: Text("Nenhum hábito adicionado"))
                  : ListView.builder(
                      itemCount: habitos.length,
                      itemBuilder: (context, index) {
                        final habito = habitos[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(habito.nome),
                            subtitle: Text(habito.descricao),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
