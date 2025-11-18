import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/transaction_item.dart';

class TransactionSuivant extends StatefulWidget {
  const TransactionSuivant({super.key});

  @override
  State<TransactionSuivant> createState() => _TransactionSuivantState();
}

class _TransactionSuivantState extends State<TransactionSuivant> {
  String searchQuery = "";
  String selectedType = "Tous";

  // 🔹 Liste de transactions (pour l’instant en dur, plus tard depuis une API)
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Salaire',
      'subtitle': 'Entreprise XYZ',
      'amount': '+ 350 000 CFA',
      'positive': true,
      'type': 'Salaire',
    },
    {
      'title': 'Senelec',
      'subtitle': 'Facture électricité',
      'amount': '- 25 000 CFA',
      'positive': false,
      'type': 'Facture',
    },
    {
      'title': 'Wave',
      'subtitle': 'Transfert reçu',
      'amount': '+ 20 000 CFA',
      'positive': true,
      'type': 'Transfert',
    },
    {
      'title': 'Retrait GAB',
      'subtitle': 'Banque UBA',
      'amount': '- 50 000 CFA',
      'positive': false,
      'type': 'Retrait',
    },
    {
      'title': 'Boutique',
      'subtitle': 'Achat nourriture',
      'amount': '- 15 200 CFA',
      'positive': false,
      'type': 'Achat',
    },
    {
      'title': 'SDE',
      'subtitle': 'Facture eau',
      'amount': '- 10 000 CFA',
      'positive': false,
      'type': 'Facture',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 🔹 Calcul des transactions filtrées (recherche + type)
    final filtered = _transactions.where((tx) {
      final query = searchQuery.toLowerCase();

      final matchesSearch = query.isEmpty ||
          tx['title'].toString().toLowerCase().contains(query) ||
          tx['subtitle'].toString().toLowerCase().contains(query) ||
          tx['amount'].toString().toLowerCase().contains(query);

      final matchesType =
          selectedType == "Tous" || tx['type'] == selectedType;

      return matchesSearch && matchesType;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: CustomAppBar(
        title: "Transactions",
        showMenu: false,
        showBack: true,
        onBack: () => context.go('/'),
      ),

      body: Column(
        children: [
          // --------- Carte solde ---------
          _buildBalanceCard(),

          // --------- Barre de recherche ---------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Rechercher (nom, montant, type...)",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFF154478)),
                ),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
          ),

          const SizedBox(height: 10),

          // --------- Filtres par type ---------
          _buildTypeFilters(),

          const SizedBox(height: 10),

          // --------- Liste des transactions ---------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final tx = filtered[index];
                final type = tx['type'] as String;

                return TransactionItem(
                  title: tx['title'],
                  subtitle: tx['subtitle'],
                  amount: tx['amount'],
                  positive: tx['positive'],
                  icon: _iconForType(type),
                  iconBackground: _colorForType(type),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ WIDGETS UI ------------------

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF154478),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Solde total",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            "415 800 CFA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Historique de vos dernières opérations",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeFilters() {
    final types = ["Tous", "Transfert", "Facture", "Retrait", "Achat", "Salaire"];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: types.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final type = types[index];
          final selected = (type == selectedType);

          return GestureDetector(
            onTap: () => setState(() => selectedType = type),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF154478) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFF154478)),
              ),
              child: Text(
                type,
                style: TextStyle(
                  color:
                  selected ? Colors.white : const Color(0xFF154478),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ------------------ LOGIQUE ICONES ------------------

  IconData _iconForType(String type) {
    switch (type) {
      case 'Transfert':
        return Icons.swap_horiz;
      case 'Facture':
        return Icons.receipt_long;
      case 'Retrait':
        return Icons.money_off;
      case 'Achat':
        return Icons.shopping_cart;
      case 'Salaire':
        return Icons.account_balance_wallet;
      default:
        return Icons.attach_money;
    }
  }

  Color _colorForType(String type) {
    switch (type) {
      case 'Transfert':
        return Colors.blueAccent;
      case 'Facture':
        return Colors.orange;
      case 'Retrait':
        return Colors.redAccent;
      case 'Achat':
        return Colors.purpleAccent;
      case 'Salaire':
        return Colors.green;
      default:
        return const Color(0xFF154478);
    }
  }
}
