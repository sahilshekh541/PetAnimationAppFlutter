import 'package:flutter/material.dart';
import 'package:petanimationapp/models/petscard.dart';

class FishListPage extends StatelessWidget {
  const FishListPage({super.key});

  @override
  Widget build(BuildContext context) {
// imagepath //map color //area names // left positioned
    List fishlist = [
      [
        'assets/images/goldenfish.png',
        Colors.deepOrange,
        'North Asia',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        'assets/images/koifish.png',
        Colors.redAccent,
        'East japan',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        'assets/images/moyefish.png',
        Colors.yellow.withOpacity(0.7),
        'Western India',
        MediaQuery.of(context).size.width * 0.2,
      ],
    ];
    return ListView.builder(
        itemCount: fishlist.length,
        itemBuilder: (context, index) {
          return PetsCard(
              bottom: -1,
              left: fishlist[index][3],
              imagepath: fishlist[index][0],
              text: fishlist[index][2],
              mapcolor: fishlist[index][1]);
        });
  }
}
