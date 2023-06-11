// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoxTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const BoxTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue)),
      child: Row(children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 35,
        ),
        const Gap(5),
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
