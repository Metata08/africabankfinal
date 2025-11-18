
// Widget pour le clavier numérique personnalisé, stylisé pour correspondre à l'image.
import 'package:flutter/material.dart';

class CustomKeypad extends StatelessWidget {
  final Function(String) onKeyPressed;

  const CustomKeypad({Key? key, required this.onKeyPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);
    // Une couleur de bordure subtile, légèrement plus claire que le fond
    final Color borderColor = Colors.blue.shade700; 

    final List<String> keys = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '00', '0', 'x',
    ];

    // Fonction d'aide pour construire une touche individuelle
    Widget buildKey(String key) {
      return InkWell(
        onTap: () => onKeyPressed(key),
        // Le splash effect pour le feedback visuel
        splashColor: Colors.blue.withOpacity(0.4), 
        child: SizedBox(
          height: 60, // Donner une hauteur fixe aux touches pour un look uniforme
          child: Center(
            child: key == 'x'
                ? const Icon(Icons.backspace_outlined, color: Colors.white, size: 24)
                : Text(
                    key,
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400),
                  ),
          ),
        ),
      );
    }

    return Container(
      color: primaryBlue,
      child: Table(
        // Appliquer une bordure à toutes les lignes et colonnes internes
        border: TableBorder.all(
          color: borderColor,
          width: 1.0,
        ),
        children: [
          // Diviser la liste de touches en lignes de 3
          TableRow(children: [
            buildKey(keys[0]),
            buildKey(keys[1]),
            buildKey(keys[2]),
          ]),
          TableRow(children: [
            buildKey(keys[3]),
            buildKey(keys[4]),
            buildKey(keys[5]),
          ]),
          TableRow(children: [
            buildKey(keys[6]),
            buildKey(keys[7]),
            buildKey(keys[8]),
          ]),
          TableRow(children: [
            buildKey(keys[9]),
            buildKey(keys[10]),
            buildKey(keys[11]),
          ]),
        ],
      ),
    );
  }
}