import 'package:flutter/material.dart';
/// Un StatefulWidget pour l'écran de connexion.
/// On pourrait le faire en StatelessWidget pour l'instant, mais un écran de connexion
/// aura forcément besoin de gérer un état plus tard (chargement, erreurs...).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // Scaffold est la structure de base de notre page (comme une feuille blanche).
    return Scaffold(
      // AppBar est la barre de titre en haut de l'écran.
      appBar: AppBar(
        title: const Text("Connexion à DakarConnect"),
      ),
      // Le corps de la page. On ajoute du Padding pour que les éléments
      // ne soient pas collés aux bords de l'écran.
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 20 pixels de marge sur tous les côtés.
        // Column est une réglette verticale qui empile ses enfants les uns sur les autres.
        child: Column(
          // Aligne les enfants au centre verticalement.
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Le champ de saisie pour l'adresse e-mail.
            TextField(
              // keyboardType spécifie le type de clavier à afficher.
              keyboardType: TextInputType.emailAddress,
              // decoration permet de styliser le champ.
              decoration: const InputDecoration(
                labelText: 'Adresse e-mail',
                border: OutlineInputBorder(), // Ajoute une bordure autour du champ.
                prefixIcon: Icon(Icons.email), // Ajoute une icône à gauche.
              ),
            ),
            // SizedBox est une boîte invisible utilisée pour créer de l'espace.
            const SizedBox(height: 20), // 20 pixels d'espace vertical.
            // Le champ de saisie pour le mot de passe.
            TextField(
              // obscureText cache le texte saisi (pour les mots de passe).
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock), // Icône de cadenas.
              ),
            ),

            const SizedBox(height: 30),

            // Le bouton de connexion.
            ElevatedButton(
              // La fonction à exécuter lors du clic. Pour l'instant, elle est vide.
              onPressed: () {
                // La logique de connexion sera ajoutée ici dans les prochains modules.
                print('Bouton de connexion cliqué !');
              },
              // style permet de personnaliser l'apparence du bouton.
              style: ElevatedButton.styleFrom(
                // Remplit le bouton sur toute la largeur disponible.
                minimumSize: const Size.fromHeight(50),
              ),
              // Le texte affiché sur le bouton.
              child: const Text('Se Connecter'),
            ),
          ],
        ),
      ),
    );
  }
}