import 'package:flutter/material.dart';
import 'package:helen_app/buyers/help-buyer.dart';
import 'package:helen_app/buyers/login-buyer.dart';
import 'homepage-buyer.dart';
import 'messages-buyer.dart';
import 'orderlists-buyer.dart';
import 'profile-buyer.dart';
import 'about-buyer.dart'; 

class NavbarBuyer extends StatefulWidget {
  final int initialIndex;

  const NavbarBuyer({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _NavbarBuyerState createState() => _NavbarBuyerState();
}

class _NavbarBuyerState extends State<NavbarBuyer> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Selected Color for Bottom Nav Bar
  static const Color selectedColor = Color(0xFFCA771A);
  static const Color unselectedColor = Color(0xFF606060);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HalfWhiteDrawer(), // Adding the drawer
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Container(
                  color: const Color(0xFFCA771A),
                  width: double.infinity,
                  height: 150,
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Image.asset(
                  'images/farmers/white-helen.png',
                  height: 100,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Open the drawer
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: Stack(
                    children: [
                      const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: const Text(
                            '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    // Handle notification tap
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                HomePageBuyer(),
                MessagesPageBuyer(),
                OrdersListsBuyer(),
                ProfilePageBuyer(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          color: selectedColor,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          color: unselectedColor,
          fontFamily: 'Poppins',
        ),
        type: BottomNavigationBarType.fixed,
        iconSize: 30, // Adjust the size of the navigation icons
      ),
    );
  }
}


// Drawer for Buyer's Profile
class HalfWhiteDrawer extends StatelessWidget {
  const HalfWhiteDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Ensure the background color is white
        width: MediaQuery.of(context).size.width / 2, // Adjust width as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header with Image and Buyer Info
            Container(
             padding: const EdgeInsets.only(
            top: 50.0, // Top padding
            left: 50.0, // Side padding (left)
            ),
              child: const Column(
                children: [
                  // Profile Image
                  CircleAvatar(
                    backgroundImage: AssetImage('images/buyers/sample-buyer-pic.jpg'),
                    radius: 100,
                  ),
                  SizedBox(height: 10.0),
                  // Buyer Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Justin T. Bala", // This will be replaced with the actual buyer's name
                        style: TextStyle(
                          color: Color(0xFFCA771A),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Institutional Buyer', // This will change based on account type
                        style: TextStyle(
                          color: Color(0xFF606060),
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            _drawerItem(
              context,
              icon: Icons.info,
              text: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutBuyer()),
                );
              },
            ),
            const SizedBox(height: 5.0),
            _drawerItem(
              context,
              icon: Icons.help,
              text: 'Help',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpBuyerScreen()),
                );
              },
            ),
            const SizedBox(height: 20.0),
            const Divider(), // Line separator
            _drawerItem(
              context,
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () {
                // Handle logout functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageBuyer()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create drawer items
  Widget _drawerItem(BuildContext context, {required IconData icon, required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFCA771A), size: 30.0),
            const SizedBox(width: 12.0),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFCA771A),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
