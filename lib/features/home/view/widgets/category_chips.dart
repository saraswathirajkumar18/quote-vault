import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Motivation', 'Stoicism', 'Success'];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Chip(
            label: Text(categories[index]),
            backgroundColor:
                index == 0 ? Colors.deepPurple : const Color(0xFF2A2545),
            labelStyle: const TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }
}
