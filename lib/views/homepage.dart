import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:petanimationapp/categorylist/birds.dart';
// import 'package:petanimationapp/categorylist/fish.dart';
// import 'package:petanimationapp/categorylist/mammals.dart';
import 'package:petanimationapp/models/category.dart';
import 'package:petanimationapp/models/petscard.dart';
import 'package:petanimationapp/views/petsdetailspage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _selectedindex = 0;

class _MyHomePageState extends State<MyHomePage> {
  int chipindex = 0;
  String chiptype = 'All';
  @override
  Widget build(BuildContext context) {
//PetList
    List petlist = [
//type // imagepath //map color //area names // left positioned
      [
        'Birds',
        'assets/images/parrot.png',
        Colors.grey.shade800,
        'Trinidad and Tobago',
        MediaQuery.of(context).size.width * 0.4,
      ],
      [
        'Birds',
        'assets/images/huming.png',
        Colors.deepPurple,
        'Eastern South America',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        'Birds',
        'assets/images/scarlet.png',
        Colors.pink,
        'South and america',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        "Fishes",
        'assets/images/goldenfish.png',
        Colors.deepOrange,
        'North Asia',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        'Fishes',
        'assets/images/koifish.png',
        Colors.redAccent,
        'East japan',
        MediaQuery.of(context).size.width * 0.2,
      ],

      [
        'Fishes',
        'assets/images/moyefish.png',
        Colors.yellow.withOpacity(0.7),
        'Western India',
        MediaQuery.of(context).size.width * 0.2,
      ],
      [
        'Mammals',
        'assets/images/rino.png',
        Colors.black38,
        'Africa and india',
        MediaQuery.of(context).size.width * 0.3,
      ],
      [
        'Mammals',
        'assets/images/whitebear.png',
        Colors.blueGrey,
        'South Poles',
        MediaQuery.of(context).size.width * 0.4,
      ],
      [
        'Mammals',
        'assets/images/fox.png',
        Colors.brown,
        'South Africa and India ',
        MediaQuery.of(context).size.width * 0.4,
      ],
    ];

    List filterpetlist = petlist
        .where((element) => (chiptype == 'All' || chiptype == element[0]))
        .toList();

    final size = MediaQuery.of(context).size;

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedindex,
            onTap: (index) {
              setState(() {
                _selectedindex = index;
              });
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.grey[900],
            elevation: 0,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: const [
              BottomNavigationBarItem(
                  label: 'shopp', icon: Icon(Icons.shopping_bag)),
              BottomNavigationBarItem(
                  label: 'shopp', icon: Icon(Icons.airplanemode_active)),
              BottomNavigationBarItem(
                  label: 'shopp', icon: Icon(Icons.newspaper)),
            ]),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          minimum: EdgeInsets.fromLTRB(size.width / 2 * 0.1,
              size.height / 3 * 0.2, size.width / 2 * 0.1, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    CupertinoIcons.layers_alt_fill,
                    color: Colors.white,
                    size: 35,
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Adope Your Pet!',
                style: GoogleFonts.workSans(
                    color: Colors.white,
                    fontSize: 38,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Protect our earth together.',
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorylist.length,
                    itemBuilder: (context, index) {
                      final selectedindex = index;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            chipindex = selectedindex;
                            chiptype = categorylist[index];
                          });
                        },
                        child: categorychip(
                          selectedindex: chipindex,
                          text: categorylist[index],
                          color: chipindex == selectedindex
                              ? Colors.amber
                              : const Color.fromRGBO(33, 33, 33, 1),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: filterpetlist.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                                PetsDetailPage(
                                  imagepath: filterpetlist[index][1],
                                ),
                                transition: Transition.zoom);
                          },
                          child: PetsCard(
                            imagepath: filterpetlist[index][1],
                            mapcolor: filterpetlist[index][2],
                            text: filterpetlist[index][3],
                            bottom: -1,
                            left: filterpetlist[index][4],
                          ),
                        );
                      })

                  // child: chiptype == 'All'
                  //     ? ListView.builder(
                  //         itemCount: petlist.length,
                  //         itemBuilder: (context, index) {
                  //           return PetsCard(
                  //             imagepath: petlist[index][0],
                  //             mapcolor: petlist[index][1],
                  //             text: petlist[index][2],
                  //             bottom: -1,
                  //             left: petlist[index][3],
                  //           );
                  //         })
                  //     : chiptype == 'Birds'
                  //         ? BirdListWidget().animate().moveX(duration: 500.ms)
                  //         : chiptype == "Mammals"
                  //             ? MammalsListPage()
                  //                 .animate()
                  //                 .moveX(duration: 500.ms)
                  //             : FishListPage()
                  //                 .animate()
                  //                 .moveX(duration: 500.ms)),
                  ),
            ],
          ),
        ));
  }
}
