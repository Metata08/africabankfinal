import 'package:africabankfinal/widgets/clavier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// L'écran principal de change, StatefulWidget car son contenu change
class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  // --- ÉTAT DU WIDGET ---

  // Liste des devises disponibles. Facile à étendre.
  final List<String> _currencies = ['\$', '£', '€', '¥'];
  late String _fromCurrency;
  late String _toCurrency;

  // Stocke la valeur brute saisie par l'utilisateur
  String _inputValue = "1000";

  // Simulation d'une table de taux de change pour l'exemple.
  // Dans une vraie application, ces données viendraient d'une API.
  final Map<String, double> _exchangeRates = {
    '\$ to £': 0.78,  '\$ to €': 0.92,  '\$ to ¥': 150.5,
    '£ to \$': 1.28,  '£ to €': 1.18,  '£ to ¥': 192.8,
    '€ to \$': 1.08,  '€ to £': 0.85,  '€ to ¥': 163.5,
    '¥ to \$': 0.0066, '¥ to £': 0.0052, '¥ to €': 0.0061,
  };

  // Initialisation de l'état du widget lors de sa création
  @override
  void initState() {
    super.initState();
    _fromCurrency = _currencies[0]; // Dollar par défaut
    _toCurrency = _currencies[1];   // Livre par défaut
  }

  // --- LOGIQUE DE L'APPLICATION ---

  // Gère la logique lorsque l'utilisateur appuie sur une touche du clavier personnalisé
  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'x') {
        // Logique de suppression (backspace)
        _inputValue = _inputValue.isNotEmpty ? _inputValue.substring(0, _inputValue.length - 1) : "";
      } else {
        // Empêche les multiples zéros au début (ex: "005")
        if (_inputValue == "0" && value != "00") _inputValue = "";
        if (_inputValue == "0" && value == "00") return; // Empêche "00" si déjà "0"

        _inputValue += value;
      }
      // Si l'utilisateur efface tout, on affiche "0"
      if (_inputValue.isEmpty) _inputValue = "0";
    });
  }

  // Formatte une chaîne de chiffres en un format monétaire lisible
  String _formatCurrency(String value) {
    if (value.isEmpty || value == "0") return "0.00";
    final number = double.parse(value);
    // En production, il est recommandé d'utiliser le package `intl` pour un formatage plus robuste.
    return number.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  // Récupère le taux de change correct basé sur les devises sélectionnées
  double _getRate() {
    if (_fromCurrency == _toCurrency) return 1.0;
    return _exchangeRates['$_fromCurrency to $_toCurrency'] ?? 0.0; // Retourne 0.0 si le taux n'est pas trouvé
  }

  // --- INTERFACE UTILISATEUR (BUILD) ---

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);
    const Color lightBlue = Color(0xFF4FC3F7);

    // Les calculs sont faits directement dans la méthode build pour se mettre à jour à chaque changement d'état
    final double fromAmount = double.tryParse(_inputValue) ?? 0.0;
    final double currentRate = _getRate();
    final double toAmount = fromAmount * currentRate;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: Row(
          children: [
                       IconButton(onPressed: () => context.go('/home') ,icon: Icon(Icons.chevron_left, color: Colors.white, size: 40,)),

          ],
        ),
        leadingWidth: 100,
        title: const Text('EXCHANGE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView( // Pour éviter le débordement sur les petits écrans
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                children: [
                  _buildCurrencyVisual(_fromCurrency, _toCurrency, primaryBlue, lightBlue),
                  const SizedBox(height: 40),
                  _buildAmountInput(
                    currencies: _currencies,
                    selectedCurrency: _fromCurrency,
                    amount: _formatCurrency(_inputValue),
                    onCurrencyChanged: (newCurrency) {
                      if (newCurrency != null) setState(() => _fromCurrency = newCurrency);
                    },
                    isFrom: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('CONVERT TO', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                  _buildAmountInput(
                    currencies: _currencies,
                    selectedCurrency: _toCurrency,
                    amount: _formatCurrency(toAmount.toString()),
                    onCurrencyChanged: (newCurrency) {
                       if (newCurrency != null) setState(() => _toCurrency = newCurrency);
                    },
                    isFrom: false,
                  ),
                ],
              ),
            ),
          ),
          // Le clavier personnalisé en bas
          CustomKeypad(onKeyPressed: _onKeyPressed),
        ],
      ),
    );
  }

  // Widget pour la section visuelle avec les cercles de devises
  Widget _buildCurrencyVisual(String from, String to, Color primaryBlue, Color lightBlue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 30, backgroundColor: primaryBlue, child: Text(from, style: const TextStyle(color: Colors.white, fontSize: 24))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Icon(Icons.arrow_forward, color: primaryBlue, size: 28),
              Icon(Icons.arrow_back, color: primaryBlue, size: 28),
            ],
          ),
        ),
        CircleAvatar(radius: 30, backgroundColor: lightBlue, child: Text(to, style: const TextStyle(color: Colors.white, fontSize: 24))),
      ],
    );
  }

  // Widget pour une ligne de saisie de montant (Sélecteur de devise + Montant)
  Widget _buildAmountInput({
    required List<String> currencies,
    required String selectedCurrency,
    required String amount,
    required ValueChanged<String?> onCurrencyChanged,
    required bool isFrom,
  }) {
    return Row(
      children: [
        // Le sélecteur de devise
        Container(
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCurrency,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              items: currencies.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Center(child: Text(currency, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                );
              }).toList(),
              onChanged: onCurrencyChanged,
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Le champ d'affichage du montant
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isFrom ? Colors.white : Colors.grey.shade100, // Couleur de fond différente pour le champ de destination
              border: Border.all(color: Colors.grey.shade400, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              amount,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isFrom ? const Color(0xFF0D47A1) : Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

