import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.cardInfo, super.key});

  final CardInfo cardInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              cardInfo.icon,
              size: 32,
              color: cardInfo.color,
            ),
            const SizedBox(height: 16),
            Text(
              cardInfo.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                cardInfo.subtitle,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfo {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  CardInfo({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}
