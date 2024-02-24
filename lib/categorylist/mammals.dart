import 'package:flutter/material.dart';
import 'package:petanimationapp/models/petscard.dart';

class MammalsListPage extends StatelessWidget {
  const MammalsListPage({super.key});

  @override
  Widget build(BuildContext context) {
// imagepath //map color //area names // left positioned
    List mammalslist = [
      [
        'assets/images/rino.png',
        Colors.black38,
        'Africa and india',
        MediaQuery.of(context).size.width * 0.3,
      ],
      [
        'assets/images/whitebear.png',
        Colors.blueGrey,
        'South Poles',
        MediaQuery.of(context).size.width * 0.4,
      ],
      [
        'assets/images/fox.png',
        Colors.brown,
        'South Africa and India ',
        MediaQuery.of(context).size.width * 0.4,
      ],
    ];
    return ListView.builder(
        itemCount: mammalslist.length,
        itemBuilder: (context, index) {
          return PetsCard(
              bottom: -1,
              left: mammalslist[index][3],
              imagepath: mammalslist[index][0],
              text: mammalslist[index][2],
              mapcolor: mammalslist[index][1]);
        });
  }
}
