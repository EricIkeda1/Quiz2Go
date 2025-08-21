class Habito {
  String pergunta;
  bool concluido;

  Habito({required this.pergunta, this.concluido = false});

  void marcar(bool valor) {
    concluido = valor;
  }
}
