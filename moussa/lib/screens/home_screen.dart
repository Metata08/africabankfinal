import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Obtenir la hauteur de l'écran 
    final screenHeight = MediaQuery.of(context).size.height;

    // Scaffold est l'échafaudage de base de tout écran Material Design.
    return Scaffold(
      // couleur de fond
      backgroundColor: Colors.white,
      // Le corps avec SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           
            Container(
              //40% de l'écran.
              height: screenHeight * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
               color:  Color(0xFF154478),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(height: 50),
                  Text(
                    'WELCOME !',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 20),
                  Icon(
                    Icons.account_balance,
                    color: Colors.white,
                    size: 100,
                  )
                ],
              ),
            ),
            
            // Partie formulaire authentification 
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username or E-email',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Mot de passe',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    // largeur de le btt 1/3 de l'ecran (votre style conservé)
                    width: MediaQuery.of(context).size.width * 1 / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        // logique derriere le btt
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF154478),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Lien "Mot de passe oublié"
                  TextButton(
                    onPressed: () {
                      // Logique pour le mot de passe oublié
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          // souligner le texte (votre style conservé)
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF2EC3EF),),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Lien d'inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("New to Bank Apps? "),
                      GestureDetector(
                        onTap: () {
                          // Logique pour l'inscription
                        },
                        child:  TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign UP",
                            style: TextStyle(
                                color: Color(0xFF2EC3EF),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF2EC3EF),
                                decorationThickness: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}