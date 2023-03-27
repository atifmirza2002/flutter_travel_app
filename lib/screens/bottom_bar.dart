import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';
import 'ticket_page.dart';
class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 0;

  final List<Widget> _screens =[
    HomePage(),
    FavoritePage(),
    TicketPage(),
    ProfilePage()
  ];

  void _onItemTapped (int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        iconSize: 24,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.black12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 28,) ,label: "Home" ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_added,size: 28) ,label: "Favorites" ),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket,size: 28) ,label: "Ticket" ),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 28) ,label: "Profile" )
        ],

      ),
    );
  }
}


