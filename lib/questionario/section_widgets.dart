import 'package:flutter/material.dart';

Widget buildSectionContainer(List<Widget> children) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.grey[850],
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: children,
    ),
  );
}

// Ajuste para os títulos das seções ficarem à esquerda
Widget buildSectionTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'GFFDevanagari',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget buildDiasDisponiveisSelector(List<bool> diasSelecionados, Function() updateState) {
  // Adiciona uma função de atualização para garantir que setState seja chamado corretamente
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Dias Disponíveis na Semana',
        style: TextStyle(
          fontFamily: 'GFFDevanagari',
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      SizedBox(height: 10),
      Row(
        children: [
          for (int i = 0; i < diasSelecionados.length; i++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: GestureDetector(
                  onTap: () {
                    diasSelecionados[i] = !diasSelecionados[i];
                    updateState(); // Atualiza o estado chamando a função passada
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: diasSelecionados[i] ? Colors.blueGrey : Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: diasSelecionados[i] ? Colors.blueGrey : Colors.white,
                      ),
                    ),
                    child: Text(
                      ['Seg', 'Ter', 'Qua', 'Qui', 'Sex'][i],
                      style: TextStyle(
                        fontFamily: 'GFFDevanagari',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ],
  );
}
