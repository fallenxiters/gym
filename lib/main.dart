// main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa a tela principal
import 'planos_screen.dart'; // Importa a tela de planos
import 'perfil_screen.dart'; // Importa a tela de perfil

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym & Nutrition Planner',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'GFFDevanagari',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[850],
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _toggleDrawer() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(animation: _animation, toggleDrawer: _toggleDrawer), // Tela principal do Ginásio Olímpico
      PlanosScreen(), // Tela de planos
      PerfilScreen(), // Tela de perfil
    ];

    return Scaffold(
      appBar: _currentIndex != 2 ? _buildCustomAppBar() : null, // Mostra o AppBar em todas as telas, exceto na aba de perfil
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ginásio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Planos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  AppBar _buildCustomAppBar() {
    return AppBar(
      titleSpacing: 16.0, // Adiciona espaçamento ao título para afastá-lo da borda
      title: Text(
        _currentIndex == 0 ? 'Ginásio Olímpico' : 'Planos',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 2; // Muda para a aba de perfil quando o ícone é clicado
              });
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://scontent.fpdl1-1.fna.fbcdn.net/v/t39.30808-6/293139482_108297045282685_2865227952238256452_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=p691mjFGs-IQ7kNvgGU_xW1&_nc_ht=scontent.fpdl1-1.fna&_nc_gid=A6LqJpDOcKcC8vv2Ahx4RXg&oh=00_AYAeIwJTXtidlWRwOoQpuibsmL5GvMbnoc-1XHDk8335iw&oe=66EFDD70',
              ),
              radius: 14, // Tamanho ajustado do CircleAvatar para ficar menor
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
