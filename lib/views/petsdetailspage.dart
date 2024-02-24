import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PetsDetailPage extends StatefulWidget {
  final String imagepath;
  const PetsDetailPage({super.key, required this.imagepath});

  @override
  State<PetsDetailPage> createState() => _PetsDetailPageState();
}

class _PetsDetailPageState extends State<PetsDetailPage>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _scalecntrl;
  @override
  void initState() {
    _scalecntrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
    animation = CurvedAnimation(parent: _scalecntrl, curve: Curves.linear);

    _scalecntrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      extendBody: true,
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 60.0),
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                                expansionFactor: 6,
                                dotHeight: 8,
                                dotWidth: 8,
                                spacing: 10,
                                activeDotColor: Colors.white,
                                dotColor: Colors.white.withOpacity(0.1)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment(0, 0),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(250),
                                    bottomLeft: Radius.circular(150),
                                    bottomRight: Radius.circular(150))),
                            child: Container(
                              height: 200,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.amber,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(250),
                                      bottomLeft: Radius.circular(150),
                                      bottomRight: Radius.circular(150))),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.grey,
                                size: 10,
                              ),
                              Text(
                                'Rhinos',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ).paddingOnly(left: 10, top: 10),
                          Text(
                            'There are two subspecies of white rhinoceros: the southern white rhinoceros (Ceratotherium simum simum) and the northern white rhinoceros (Ceratotherium simum cottoni). As of 2013, the southern subspecies has a wild population of 20,405—making them the most abundant rhino subspecies in the world. The northern subspecies is critically endangered, with all that is known to remain being two captive females. There is no conclusive explanation of the name "white rhinoceros". A popular idea that "white" is a distortion of either the Afrikaans word wyd or the Dutch word wijd (or its other possible spellings whyde, weit, etc.,), meaning "wide" and referring to the rhino\'s square lips, is not supported by linguistic studies',
                            style: TextStyle(
                                color: Colors.white,
                                wordSpacing: 1,
                                fontSize: 16),
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ).paddingOnly(left: 10, right: 10, top: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Donate',
                              style: GoogleFonts.stylish(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 227, 188, 174)
                                .withOpacity(0.1),
                            const Color.fromARGB(255, 118, 96, 88)
                                .withOpacity(0.6)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  backgroundColor:
                                      const Color.fromARGB(255, 227, 188, 174)
                                          .withOpacity(0.4),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () {},
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 4,
              left: MediaQuery.of(context).size.height / 2 * 0.2,
              child: ScaleTransition(
                scale: _scalecntrl,
                child: Image.asset(
                  widget.imagepath,
                  height: 300,
                ),
              ))
        ],
      ),
    );
  }
}
