import 'package:flutter/material.dart';
import 'package:petanimationapp/models/petscard.dart';

class BirdListWidget extends StatelessWidget {
  const BirdListWidget({super.key});

  @override
  Widget build(BuildContext context) {
// imagepath //map color //area names // left positioned
    List birdlist = [
      [
        'assets/images/parrot.png',
        Colors.grey.shade800,
        'Trinidad and Tobago',
        MediaQuery.of(context).size.width * 0.4,
      ],
      [
        'assets/images/huming.png',
        Colors.deepPurple,
        'Eastern South America',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        'assets/images/scarlet.png',
        Colors.pink,
        'South and america',
        MediaQuery.of(context).size.width * 0.2,
      ],
    ];
    return ListView.builder(
        itemCount: birdlist.length,
        itemBuilder: (context, index) {
          return PetsCard(
              bottom: -1,
              left: birdlist[index][3],
              imagepath: birdlist[index][0],
              text: birdlist[index][2],
              mapcolor: birdlist[index][1]);
        });
  }
}
