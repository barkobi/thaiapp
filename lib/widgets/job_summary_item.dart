import 'package:flutter/material.dart';

class JobSummaryItem extends StatelessWidget {
  const JobSummaryItem(
      {super.key,
      required this.headline,
      required this.data,
      required this.icon});

  final String headline;
  final String data;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headline,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
