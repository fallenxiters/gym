import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'opcoes_questionario.dart';
import 'input_widgets.dart';
import 'section_widgets.dart';
import 'form_handlers.dart';

class QuestionarioScreen extends StatefulWidget {
  @override
  _QuestionarioScreenState createState() => _QuestionarioScreenState();
}

class _QuestionarioScreenState extends State<QuestionarioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _fieldKeys = <GlobalKey<FormFieldState>>[];
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String? genero;
  String? nivelAtividade;
  String? tempoExercicio;
  String? objetivo;
  String? experiencia;
  String? condicaoSaude;
  String? alergias;
  String? restricoesAlimentares;
  String? frequenciaRefeicoes;
  String? consumoAgua;
  String? suplementacao;
  String? preferenciaExercicio;
  String? horarioTreino;
  String? intensidadeTreino;
  String? qualidadeSono;
  String? atividadesExtras;
  String? motivacao;
  List<bool> diasSelecionados = [false, false, false, false, false];
  bool showErrorIcons = false;

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showErrorAlert() {
    setState(() {
      showErrorIcons = true;
    });
    _scrollToTop();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showErrorIcons = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Questionário',
          style: TextStyle(
            fontFamily: 'GFFDevanagari',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              if (showErrorIcons)
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.red[400],
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Todos os campos obrigatórios devem ser preenchidos!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Seção: Informações Pessoais
                    buildSectionTitle('Informações Pessoais'),
                    buildSectionContainer([
                      buildNumericTextField('Idade', _idadeController,
                          'Isso não se parece com uma idade, pois não?', _fieldKeys, showErrorIcons),
                      buildNumericTextField('Peso (kg)', _pesoController,
                          'Peso com letras? Isso é estranho!', _fieldKeys, showErrorIcons),
                      buildHeightTextField(
                          'Altura (m,cm)', _alturaController, _fieldKeys, showErrorIcons),
                      buildDropdownField(
                        'Género',
                        opcoesGenero,
                        genero,
                        (value) {
                          setState(() {
                            genero = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                    ]),

                    // Seção: Objetivos e Condições
                    buildSectionTitle('Objetivos e Condições'),
                    buildSectionContainer([
                      buildDropdownField(
                        'Objetivo Principal',
                        opcoesObjetivo,
                        objetivo,
                        (value) {
                          setState(() {
                            objetivo = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Nível de Experiência',
                        opcoesExperiencia,
                        experiencia,
                        (value) {
                          setState(() {
                            experiencia = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Condições de Saúde ou Lesões',
                        opcoesCondicaoSaude,
                        condicaoSaude,
                        (value) {
                          setState(() {
                            condicaoSaude = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                    ]),

                    // Seção: Hábitos Alimentares
                    buildSectionTitle('Hábitos Alimentares'),
                    buildSectionContainer([
                      buildDropdownField(
                        'Alergias Alimentares',
                        opcoesAlergias,
                        alergias,
                        (value) {
                          setState(() {
                            alergias = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Restrição Alimentar',
                        opcoesRestricoesAlimentares,
                        restricoesAlimentares,
                        (value) {
                          setState(() {
                            restricoesAlimentares = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Refeições Diárias',
                        opcoesRefeicoes,
                        frequenciaRefeicoes,
                        (value) {
                          setState(() {
                            frequenciaRefeicoes = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Consumo de Água (litros/dia)',
                        opcoesConsumoAgua,
                        consumoAgua,
                        (value) {
                          setState(() {
                            consumoAgua = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Suplementação',
                        opcoesSuplementacao,
                        suplementacao,
                        (value) {
                          setState(() {
                            suplementacao = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                    ]),

                    // Seção: Rotina de Exercícios
                    buildSectionTitle('Rotina de Exercícios'),
                    buildSectionContainer([
                      buildDropdownField(
                        'Tipos de Exercícios Preferidos',
                        opcoesExercicios,
                        preferenciaExercicio,
                        (value) {
                          setState(() {
                            preferenciaExercicio = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Horário Preferido para Exercícios',
                        opcoesHorarioExercicios,
                        horarioTreino,
                        (value) {
                          setState(() {
                            horarioTreino = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Intensidade Preferida dos Treinos',
                        opcoesIntensidadeTreino,
                        intensidadeTreino,
                        (value) {
                          setState(() {
                            intensidadeTreino = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Qualidade do Sono',
                        opcoesQualidadeSono,
                        qualidadeSono,
                        (value) {
                          setState(() {
                            qualidadeSono = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Frequência de Exercícios Semanais',
                        opcoesFrequenciaExercicios,
                        nivelAtividade,
                        (value) {
                          setState(() {
                            nivelAtividade = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Tempo Disponível para Exercícios',
                        opcoesTempoExercicios,
                        tempoExercicio,
                        (value) {
                          setState(() {
                            tempoExercicio = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDiasDisponiveisSelector(
                          diasSelecionados, () => setState(() {})),
                    ]),

                    // Seção: Informações Adicionais
                    buildSectionTitle('Informações Adicionais'),
                    buildSectionContainer([
                      buildDropdownField(
                        'Atividades Físicas Fora do Ginásio',
                        opcoesAtividadesExtras,
                        atividadesExtras,
                        (value) {
                          setState(() {
                            atividadesExtras = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                      buildDropdownField(
                        'Motivação para Treinar',
                        opcoesMotivacao,
                        motivacao,
                        (value) {
                          setState(() {
                            motivacao = value;
                          });
                        },
                        _fieldKeys,
                        showErrorIcons,
                      ),
                    ]),

                    // Botão de Enviar
                    SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50), // Largura máxima horizontal
                      ),
                      onPressed: () {
                        final isValid = _formKey.currentState?.validate() ?? false;
                        if (!isValid) {
                          _showErrorAlert(); // Função que mostra o alerta
                        } else {
                          _formKey.currentState!.save();
                          // Continue com o envio dos dados
                        }
                      },
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          fontFamily: 'GFFDevanagari',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
