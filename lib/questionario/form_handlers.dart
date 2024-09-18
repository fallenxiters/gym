import 'package:flutter/material.dart';

void submitForm(
  GlobalKey<FormState> formKey,
  List<GlobalKey<FormFieldState>> fieldKeys,
  ScrollController scrollController,
  TextEditingController idadeController,
  TextEditingController pesoController,
  TextEditingController alturaController,
  String? genero,
  String? nivelAtividade,
  String? tempoExercicio,
  List<bool> diasSelecionados,
  String? objetivo,
  String? experiencia,
  String? condicaoSaude,
  String? alergias,
  String? restricoesAlimentares,
  String? frequenciaRefeicoes,
  String? consumoAgua,
  String? suplementacao,
  String? preferenciaExercicio,
  String? horarioTreino,
  String? intensidadeTreino,
  String? qualidadeSono,
  String? atividadesExtras,
  String? motivacao,
  Function setShowErrorIcons,
) {
  final isValid = formKey.currentState?.validate() ?? false;

  if (!isValid) {
    setShowErrorIcons(true);
    showDialog(
      context: formKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text('Campos Obrigatórios'),
        content: Text('Por favor, preencha todos os campos obrigatórios.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    fieldKeys.forEach((key) {
      key.currentState?.validate();
    });
  } else {
    formKey.currentState!.save();
    setShowErrorIcons(false);
  }
}
