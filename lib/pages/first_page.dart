import 'package:app_one/pages/home_page.dart';
import 'package:app_one/pages/profile_page.dart';
import 'package:app_one/pages/settings_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List _pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage()
  ];

  int _selectedItem = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page"),),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: Column(
          children: [
            const DrawerHeader(child: Text('Drawer')),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home Page'),
              onTap: (){
                Navigator.pushNamed(context, '/home_page');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: (){
                Navigator.pushNamed(context, '/settings_page');
              },
            )
          ],
        ),
      ),
      body: _pages[_selectedItem],
      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
      //     },
      //     child: const Text("Go to Second Page"),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
