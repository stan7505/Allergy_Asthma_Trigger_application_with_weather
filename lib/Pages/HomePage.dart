import 'package:flutter/material.dart';
import 'package:weather_demo/Pages/AirPage/airpage.dart';
import 'package:weather_demo/Pages/WeatherPage/weatherpage.dart';
import '../Components/BottomNavigation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;

  List pages = [
    const Airpage(),
    const Weatherpage(),
  ];

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: const Text('WeAl', style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              child: Center(child: Text('WeAl', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: ListTile(
                  title: const Text('Pollution Info', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, 'pollution_info');
                  },
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      const Text('Personalization', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 30,
                     ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'personalization');
                  },
                ),
              ),
            ),

          ],
        ),
      ),
      body: pages[selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Bottomnavigation(
            value: selectedindex,
            onTap: onTapped,
          ),
        ),
      ),
    );
  }
}