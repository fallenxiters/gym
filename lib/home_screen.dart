// home_screen.dart
import 'package:flutter/material.dart';
import 'questionario/questionario_screen.dart'; // Importa a tela do questionário

class HomeScreen extends StatefulWidget {
  final Animation<double> animation;
  final VoidCallback toggleDrawer;

  HomeScreen({required this.animation, required this.toggleDrawer});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        double slide = widget.animation.value * 220; // Ajusta o deslocamento da tela ao abrir o drawer
        return Transform.translate(
          offset: Offset(slide, 0),
          child: Scaffold(
            body: Column(
              children: [
                _buildQuestionnaireButton(), // Botão de questionário no topo
                Expanded(child: Container()), // Container vazio para preencher o espaço restante
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuestionnaireButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900], // Cor cinzento bem escuro
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // Remove os divisores do ExpansionTile
            splashColor: Colors.transparent, // Remove o efeito de clique
            highlightColor: Colors.transparent, // Remove o efeito de clique
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16.0), // Ajusta o padding do tile
            onExpansionChanged: (bool expanded) {
              setState(() => _isExpanded = expanded);
            },
            title: Text(
              'Realizar Questionário',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.white,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• Indique alguns dados pessoais',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 4), // Espaçamento reduzido entre as indicações
                    Text(
                      '• É crucial indicar dados reais para precisão',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 4), // Espaçamento reduzido entre as indicações
                    Text(
                      '• Leia atentamente todos os campos, antes de os preencher',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 8), // Espaçamento maior antes do botão
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(double.infinity, 50), // Largura máxima para preencher horizontalmente
                  ),
                  onPressed: () {
                    // Navegação para a tela de preenchimento do questionário
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionarioScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Iniciar Questionário',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
