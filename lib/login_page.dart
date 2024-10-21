// lib/login_page.dart

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Clés pour le formulaire
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  // Fonction de connexion (à personnaliser selon vos besoins)
  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Ici, vous pouvez ajouter la logique de connexion (API, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connexion réussie pour $_username')),
      );
      // Naviguer vers la page principale ou fermer la page de connexion
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utilisation d'un dégradé en arrière-plan
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade800, Colors.red.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Titre de la page
                Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 20.0),
                // Formulaire de connexion
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Champ pour le nom d'utilisateur
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.white70),
                          hintText: 'Nom d\'utilisateur',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom d\'utilisateur';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                      SizedBox(height: 20.0),
                      // Champ pour le mot de passe
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.white70),
                          hintText: 'Mot de passe',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility, color: Colors.white70),
                            onPressed: () {
                              // Logique pour afficher/masquer le mot de passe
                            },
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        obscureText: true, // Masque le mot de passe
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 30.0),
                      // Bouton de connexion avec une animation légère
                      ElevatedButton(
                        onPressed: _login,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          child: Text(
                            'Se Connecter',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade800,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Couleur du bouton
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 5.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      // Option "Mot de passe oublié"
                      TextButton(
                        onPressed: () {
                          // Action pour "Mot de passe oublié"
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Fonctionnalité à implémenter')),
                          );
                        },
                        child: Text(
                          'Mot de passe oublié?',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
