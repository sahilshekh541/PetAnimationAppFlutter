import 'package:flutter/material.dart';

List categorylist = ['All', 'Birds', 'Mammals', 'Fishes'];

class categorychip extends StatelessWidget {
  final int selectedindex;
  final Color color;
  final String text;
  const categorychip({
    super.key,
    required this.selectedindex,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
          side: BorderSide.none,
          color: MaterialStatePropertyAll(color),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          label: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
