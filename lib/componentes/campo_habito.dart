import 'package:flutter/material.dart';

class CampoHabito extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CampoHabito({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
