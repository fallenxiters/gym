// planos_screen.dart
import 'package:flutter/material.dart';

class PlanosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPlanButton(
              context,
              icon: Icons.fitness_center,
              title: 'Planos de Treino',
            ),
            SizedBox(height: 16),
            _buildPlanButton(
              context,
              icon: Icons.restaurant_menu,
              title: 'Planos de Alimentação',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanButton(BuildContext context, {required IconData icon, required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], // Estilo cinzento escuro similar ao iPhone
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onTap: () {
          // Implementar navegação para cada plano se necessário
        },
      ),
    );
  }
}
