[Yesterday 15:12] Bruce Mhlanga

import 'package:flutter/material.dart';

 

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

 

  @override

  _HomeScreenState createState() => _HomeScreenState();

}

 

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

 

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('SmartList'),

        backgroundColor: Colors.green, // Make the app bar transparent

      ),

      body: Padding(

        padding: const EdgeInsets.only(top: 16.0),

        child: ListView(

          // Remove scrollDirection property to make it vertical

          children: [

            buildButton(

              context,

              Icons.category,

              'Category',

              '/category',

              backgroundImage: const AssetImage('lib/images/veg.png'),

            ),

            buildButton(

              context,

              Icons.playlist_add,

              'Create List',

              '/create-list',

              backgroundImage: const AssetImage('lib/images/list.jpg'),

            ),

            buildButton(

              context,

              Icons.save,

              'Save Recipes',

              '/save-recipes',

              backgroundImage: const AssetImage('lib/images/reciepe.png'),

            ),

            buildButton(

              context,

              Icons.money,

              'Budget',

              '/budget',

              backgroundImage: const AssetImage('lib/images/money.jpg'),

            ),

            buildButton(

              context,

              Icons.local_offer,

              'Discounts and Specials',

              '/discounts',

              backgroundImage: const AssetImage('lib/images/discount.jpg'),

            ),

          ],

        ),

      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,

        onTap: (int index) {

          if (index == 2) {

            // Check if the Profile icon is clicked (index 2)

            Navigator.pushNamed(context, '/sidebar'); // Navigate to the Sidebar

          } else if (index == 1) {

            // Check if the Favorites icon is clicked (index 1)

            Navigator.pushNamed(

                context, '/favorites'); // Navigate to the Favorites page

          } else {

            setState(() {

              _currentIndex = index;

            });

          }

        },

        items: [

          BottomNavigationBarItem(

            icon: Icon(Icons.home),

            label: 'Home',

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.favorite),

            label: 'Favorites',

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.person),

            label: 'Profile',

          ),

        ],

      ),

    );

  }

 

  Widget buildButton(

    BuildContext context,

    IconData icon,

    String label,

    String route, {

    required ImageProvider<Object> backgroundImage,

  }) {

    return Container(

      width: 300.0, // Adjust the width as needed

      height: 120.0,

      margin: const EdgeInsets.all(8.0), // Add margin to separate buttons

      decoration: BoxDecoration(

        image: DecorationImage(

          image: backgroundImage,

          fit: BoxFit.fill,

        ),

      ),

      child: ElevatedButton.icon(

        onPressed: () {

          Navigator.pushNamed(context, route);

        },

        icon: Icon(

          icon,

          size: 50.0, // Adjust the icon size as needed

          color: Colors.white,

        ),

        label: Text(

          label,

          style: const TextStyle(

            color: Colors.white,

          ),

        ),

        style: ElevatedButton.styleFrom(

          foregroundColor: Colors.transparent,

          backgroundColor: Colors.transparent,

        ),

      ),

    );

  }

}

 
