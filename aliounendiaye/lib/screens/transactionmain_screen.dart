import 'package:africa_bank/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionHubPage extends StatelessWidget {
  const TransactionHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonHeight = size.height * 0.12; // hauteur responsive
    final buttonPadding = size.width * 0.05; // padding responsive

    return Scaffold(
      appBar: CustomAppBar(
        title: "Transactions",
        showMenu: true,
        showBack: true,
        onBack: () => context.go('/home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(buttonPadding),
        child: Column(
          children: [
            _buildActionCard(
              context,
              Icons.swap_horiz,
              "Transfer",
              "/transaction/transfer",
              buttonHeight,
            ),
            SizedBox(height: buttonPadding),
            _buildActionCard(
              context,
              Icons.qr_code_scanner,
              "Scan QR",
              "/transaction/scan",
              buttonHeight,
            ),
            SizedBox(height: buttonPadding),
            _buildActionCard(
              context,
              Icons.history,
              "History",
              "/transaction/history",
              buttonHeight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    IconData icon,
    String label,
    String route,
    double height,
  ) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        width: width,          // full width responsive
        height: height,        // responsive height
        decoration: BoxDecoration(
          color: const Color(0xFFEFF7FF),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Row(
          children: [
            Icon(icon, size: height * 0.45, color: const Color(0xFF154478)),
            SizedBox(width: width * 0.05),
            Text(
              label,
              style: TextStyle(
                fontSize: height * 0.22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
