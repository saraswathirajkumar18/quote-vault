import 'package:flutter/material.dart';
import 'package:quote_vault/features/home/model/qoute.dart';

class QuoteOfDayCard extends StatelessWidget {
  final Quote quote;

  const QuoteOfDayCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF2E1A47), Color(0xFF1A1333)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote.category.toUpperCase(),
            style: const TextStyle(
              color: Colors.purpleAccent,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '“${quote.text}”',
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '— ${quote.author}',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
