import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PetsCard extends StatelessWidget {
  final String imagepath;
  final String text;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Color mapcolor;

  const PetsCard({
    super.key,
    required this.imagepath,
    required this.text,
    required this.mapcolor,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
        ),
        Positioned(
          top: 13,
          left: 8,
          child: Container(
            height: 260,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter:
                                  ColorFilter.mode(mapcolor, BlendMode.lighten),
                              image: const AssetImage(
                                'assets/images/map.png',
                              ),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/maps-and-flags.png',
                            ),
                            height: 20,
                          ),
                          Flexible(
                              child: Text(
                            text,
                            style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 1),
                          ))
                        ],
                      ).paddingOnly(left: 10, bottom: 10)),
                )),
                Expanded(
                    child: Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20))),
                        child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              color: Colors.white,
                              size: 30,
                            ))),
                  ),
                )),
              ],
            ),
          ),
        ),
        Positioned(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
          child: Image.asset(
            imagepath,
            height: 280,
          ),
        )
      ],
    );
  }
}
