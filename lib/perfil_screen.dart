// perfil_screen.dart
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildUserInfo(),
            SizedBox(height: 20), // Adiciona mais espaço entre a seção de informações e os botões
            _buildEditProfileButton(context),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none, // Permite que o avatar se expanda além do limite
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            image: DecorationImage(
              image: NetworkImage(
                'https://source.unsplash.com/featured/?gym,fitness',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: -40, // Ajusta a posição para que a foto de perfil fique visível corretamente
          child: CircleAvatar(
            radius: 60, // Aumenta o tamanho do avatar para maior destaque
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 58,
              backgroundImage: NetworkImage(
                'https://scontent.fpdl1-1.fna.fbcdn.net/v/t39.30808-6/293139482_108297045282685_2865227952238256452_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=p691mjFGs-IQ7kNvgGU_xW1&_nc_ht=scontent.fpdl1-1.fna&_nc_gid=A6LqJpDOcKcC8vv2Ahx4RXg&oh=00_AYAeIwJTXtidlWRwOoQpuibsmL5GvMbnoc-1XHDk8335iw&oe=66EFDD70',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 45, 16, 0), // Ajuste para alinhar o texto à esquerda e ajustar o espaçamento
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nome do Usuário',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left, // Alinhamento à esquerda
          ),
          SizedBox(height: 1), // Aproxima ainda mais o e-mail do nome de usuário
          Text(
            'usuario@email.com', // E-mail alinhado abaixo do nome
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
            textAlign: TextAlign.left, // Alinhamento à esquerda
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Cor azul para o botão de editar perfil
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, 50), // Faz o botão preencher a largura
        ),
        onPressed: () {
          // Implementar função de editar perfil
        },
        child: Text('Editar Perfil'),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, 50), // Faz o botão preencher a largura
        ),
        onPressed: () {
          // Implementar função de terminar sessão
        },
        child: Text('Terminar Sessão'),
      ),
    );
  }
}
