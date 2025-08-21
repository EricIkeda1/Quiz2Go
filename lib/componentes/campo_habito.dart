import 'package:flutter/material.dart';

class CampoHabito extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdicionar;

  const CampoHabito({
    super.key,
    required this.controller,
    required this.onAdicionar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Novo hábito...",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: onAdicionar,
          child: const Text("Adicionar"),
        ),
      ],
    );
  }
}
