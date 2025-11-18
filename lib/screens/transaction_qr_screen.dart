import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Pour générer le code QR
import 'package:barcode_widget/barcode_widget.dart'; // Pour générer le code-barres

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Définition des couleurs pour un accès facile
    const Color primaryBlue =
        Color(0xFF154478); // Un bleu foncé similaire à l'image
    const Color lightTextColor = Colors.white70;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF154478),
        elevation: 0,
        //  icon de navigation de retour dans l'application
        leading: Row(
          children: [
            IconButton(onPressed: () => context.go('/transaction') ,icon: Icon(Icons.chevron_left, color: Colors.white, size: 40,)),
          ],
        ),
        title: const Text(
          'TRANSACTION',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2, //  plus d'espace en haut
            child: Container(
              width: double.infinity,
              color: primaryBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'SCAN THIS QR CODE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: QrImageView(
                      data:
                          'your-email@email.com', // Les données à encoder dans le QR Code
                      version: QrVersions.auto,
                      size: 150.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'YOUR NAME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'your-email@email.com',
                    style: TextStyle(
                      color: lightTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Try BARCODE',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  BarcodeWidget(
                    barcode: Barcode.code128(), // Type de code-barres
                    data: '123456789', // Données du code-barres
                    width: 200,
                    height: 60,
                    drawText:
                        false, // Ne pas afficher le texte sous le code-barres
                  ),
                  const Spacer(), // Pousse le texte suivant vers le bas
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Can't scan the QR Code? ",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Try   '),
                            GestureDetector(
                              onTap: () {
                                // Action pour " Bank Account"
                              },
                              child: const Text(
                                'Bank Account',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
