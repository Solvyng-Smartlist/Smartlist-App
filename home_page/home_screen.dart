import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentAdIndex = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const Duration duration = Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        currentAdIndex = (currentAdIndex + 1) % ads.length;
      });
    });
  }

  Widget buildAdSlide(String adImagePath) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          adImagePath,
          width: 200.0,
          height: 150.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget buildImageCard(String imagePath, String title, int index) {
    // Check the index and set a different image path
    if (index == 1) {
      imagePath = 'assets/pic2.jpg';
    } else if (index == 2) {
      imagePath = 'assets/pic3.jpg';
    } else if (index == 3) {
      imagePath = 'assets/pic7.jpg';
  } else if (index == 4) {
  imagePath = 'assets/pic6.jpg';
  } else if (index == 5) {
  imagePath = 'assets/pic4.jpg';
  }

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        onTap: () {
          print('Image $title pressed!');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Set BoxFit.cover for a better fit
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }


  final List<String> ads = [
    'assets/Grocery-discount.jpg',
    'assets/pic4.jpg',
    'assets/Grocery-discount.jpg',
    'assets/pic1.webp'
  ];

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 2.9;
    return Scaffold(

      appBar: AppBar(

        flexibleSpace: Container(

          height: appBarHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/SmartList11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 16.0,
                right: 16.0,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle menu item selection
                    print('Selected: $value');
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'item1',
                        child: Text('Category'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'item2',
                        child: Text('Grocery History'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'item3',
                        child: Text('Logout'),

                      ),
                    ];
                  },
                  child: const Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180.0,
            width: 500,
            child: buildAdSlide(ads[currentAdIndex]),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return buildImageCard(
                  'assets/pic5.jpg',
                  '       Category ',
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
