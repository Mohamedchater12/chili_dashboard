// lib/main.dart

import 'package:flutter/material.dart';
import 'login_page.dart'; // Importer la page de connexion

void main() {
  runApp(ChiliDashboardApp());
}

class ChiliDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chili\'s Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // Décommentez la ligne suivante si vous utilisez une police personnalisée
        // fontFamily: 'CustomFont',
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Index actuel de la page sélectionnée
  int _selectedIndex = 0;

  // Liste des widgets pour chaque page
  static List<Widget> _pages = <Widget>[
    HomePage(),
    CartPage(),
    OrderPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ajout d'un Drawer pour une navigation supplémentaire
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_restaurant,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Chili\'s Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Panier'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Commander'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      // Création de la Navbar avec le titre et les icônes
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.local_restaurant), // Icône de restaurant
            SizedBox(width: 10), // Espacement entre l'icône et le texte
            Text('Chili\'s Dashboard'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: 'À propos',
            onPressed: () {
              // Action pour afficher des informations
              showAboutDialog(
                context: context,
                applicationName: 'Chili\'s Dashboard',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(Icons.local_restaurant),
                children: [
                  Text('Application de gestion pour le restaurant Chili\'s.'),
                ],
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.login), // Icône de connexion
            tooltip: 'Connexion',
            onPressed: () {
              // Naviguer vers la page de connexion
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      // Utilisation de Stack pour placer l'image en arrière-plan
      body: Stack(
        children: [
          // Image de fond avec un filtre de couleur
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/restaurant_red.jpg'),
                fit: BoxFit.cover,

                ),
              ),
            ),

          // Contenu au-dessus de l'image de fond
          _pages.elementAt(_selectedIndex),
        ],
      ),
      // Barre de navigation en bas avec trois icônes
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Commander',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.red,
        onTap: _onItemTapped,
      ),
      // Ajouter un FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action du FAB
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

// Pages individuelles
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
