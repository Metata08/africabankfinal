import 'package:africa_bank/widgets/header.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  // Clé pour ouvrir le drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "Dashboard",
        showMenu: true,
        showBack: false, // pas de bouton retour
        onMenu: () => _scaffoldKey.currentState!.openDrawer(),
        onSettings: () {},
      ),

      drawer: buildAppDrawer(context),

      body: SingleChildScrollView(
        child: Column(
          spacing: screenHeight * 0.05,
          children: [
            // HEADER BLEU AVEC AVATAR
            Container(
              height: screenHeight * 0.40,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF154478), Color(0xFF154478)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                // spacing: screenHeight*0.40*0.01,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar rond
                  Container(
                    width: screenHeight * 0.10,
                    height: screenHeight * 0.10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFCFDFD), Color(0xFFFCFDFD)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: screenWidth * 0.10,
                      color: Color(0xFF2EC3EF),
                    ),
                  ),

                  const Text(
                    'Your Name',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),

                  const Text(
                    'your-email@mail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  Container(
                    width: screenWidth * 0.60,
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCFDFD),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'BALANCE',
                          style: TextStyle(
                            color: Color(0xFF2EC3EF),
                            fontSize: 14,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Text(
                          '\$4,180.20',
                          style: TextStyle(
                            color: Color(0xFF154478),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 10),
                        SizedBox(
                          width: screenWidth * 0.25,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF154478),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'TRANSFER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // BLOC BALANCE

            // BUTTON TRANSFER

            // --- LISTE DES DERNIÈRES TRANSACTIONS ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LATEST TRANSACTIONS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF154478),
                    ),
                  ),
                  // --- Exemple de Transaction ---
                  ..._buildTransactionList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction qui génère la liste des transactions
  List<Widget> _buildTransactionList() {
    final transactions = [
      {'title': 'Lorem Ipsum Company', 'amount': '+230.80'},
      {'title': 'Electric Bill', 'amount': '-259.50'},
      {'title': 'Conque Quisque Transfer', 'amount': '+150.00'},
      {'title': 'Outisque Withdraw', 'amount': '-510.00'},
    ];

    return transactions
        .map(
          (t) => Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF7FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t['title']!, style: const TextStyle(fontSize: 15)),
                Text(
                  t['amount']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: t['amount']!.startsWith('+')
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
