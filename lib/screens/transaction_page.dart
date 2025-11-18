import 'package:africabankfinal/widgets/balance_card.dart';
import 'package:africabankfinal/widgets/header.dart';
import 'package:africabankfinal/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  // 🔑 KEY pour contrôler le Drawer correctement
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // 👈 IMPORTANT pour ouvrir le Drawer

      // ----------- CUSTOM APP BAR -----------
      appBar: CustomAppBar(
        title: "",
        showMenu: true,
        showBack: false,
        onMenu: () {
          _scaffoldKey.currentState?.openDrawer(); // 👈 Ouvre le menu correctement
        },
      ),

      // ----------- DRAWER -----------
      drawer: buildAppDrawer(context),

      // ----------- CONTENU DE LA PAGE -----------
      body: Column(
        children: [
          // ------------------- PARTIE BLEUE FIXE -------------------
          Container(
            width: double.infinity,
            color: const Color(0xFF154478),
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 55,
                    color: Color(0xFF154478),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "YOUR NAME",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "your-email@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),

                SizedBox(height: 15),

                // ---------- Balance Card ----------
                BalanceCard(),
              ],
            ),
          ),

          // ------------------- PARTIE BLANCHE SCROLL -------------------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- TITRE ----------
                  const Text(
                    "LATEST TRANSACTIONS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ---------- LISTE DES TRANSACTIONS ----------
                  const TransactionItem(
                    title: "Lorem Ipsum Company",
                    subtitle: "Received payment",
                    amount: "+\$2,030.80",
                    positive: true,
                  ),

                  const TransactionItem(
                    title: "Auctor Elit Ltd.",
                    subtitle: "Transfer money",
                    amount: "-\$450.00",
                    positive: false,
                  ),

                  const TransactionItem(
                    title: "Luctus Sit Amet Est",
                    subtitle: "Electricity bill",
                    amount: "-\$239.50",
                    positive: false,
                  ),

                  const TransactionItem(
                    title: "Congue Quisque",
                    subtitle: "Withdraw money",
                    amount: "-\$1,500.00",
                    positive: false,
                  ),

                  const SizedBox(height: 10),

                  // ---------- BOUTON MORE ----------
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go('/transaction_suivant');
                      },
                      child: const Text(
                        "MORE >>",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF154478),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
