import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      width: 230,
      child: Column(
        children: [
          const Text(
            "BALANCE",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Text(
            "\$4,180.20",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
              color: const Color(0xFF154478),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              "TRANSFER",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
