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
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              "Bem-vindo ao seu Diário de Hábitos!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 3.5,
                mainAxisSpacing: 16,
                children: [
                  _buildCard(
                    context,
                    icon: Icons.quiz,
                    title: "Começar Quiz",
                    description: "Responda perguntas sobre seus hábitos",
                    color: Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz()),
                      );
                    },
                  ),
                  _buildCard(
                    context,
                    icon: Icons.add,
                    title: "Adicionar Hábito",
                    description: "Inclua novos hábitos para acompanhar",
                    color: Colors.orange,
                    onTap: () {
                    },
                  ),
                  _buildCard(
                    context,
                    icon: Icons.bar_chart,
                    title: "Ver Estatísticas",
                    description: "Acompanhe seu progresso diário",
                    color: Colors.purple,
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        color: color.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 5),
                    Text(description,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white70)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
