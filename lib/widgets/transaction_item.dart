import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final bool positive;

  // 👇 NOUVEAUX PARAMÈTRES OPTIONNELS
  final IconData icon;
  final Color iconBackground;

  const TransactionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.positive,
    this.icon = Icons.attach_money,                      // valeur par défaut
    this.iconBackground = const Color(0xFF154478),      // valeur par défaut
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconBackground,
            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
                Text(subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: positive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
