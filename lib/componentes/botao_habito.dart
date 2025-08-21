import 'package:flutter/material.dart';

class BotaoHabito extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoHabito({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(texto),
        ),
      ),
    );
  }
}
