import 'package:flutter/material.dart';
import 'package:gogol/screens/Chat.dart';
import 'package:gogol/screens/home.dart';
import 'package:gogol/screens/myCartEmpty.dart';
import 'package:gogol/screens/newUserReminder.dart';
import 'package:gogol/screens/profileDrawer.dart';


class CustomNavBar extends StatefulWidget {
  CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void openDrawer() {
    _key.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      home(),
      myCartEmpty(),
      newUserReminder(),
      Chat(),
      Center(),
    ];
    return Scaffold(
      key: _key,
      drawer: profileDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff0c7c81),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffffffff),
        selectedLabelStyle: TextStyle(fontSize: 10, fontFamily: "Inter", fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 10, fontFamily: "Inter", fontWeight: FontWeight.w500),
        unselectedItemColor: Color(0x90ffffff),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Icon(Icons.home, color: Colors.white, size: 20,),
            ),
            label: "Home",
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Icon(Icons.home, color: Color(0x90ffffff), size: 20,),
            ),
          ),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 20,)
              ),
              label: "Cart",
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Icon(Icons.shopping_cart_outlined, color: Color(0x90ffffff), size: 20,),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(Icons.timer_outlined, color: Colors.white, size: 20,)
              ),
              label: "Reminder",
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(Icons.timer_outlined, color: Color(0x90ffffff), size: 20,)
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: ImageIcon(AssetImage("assets/images/chat-icon.png"), color: Colors.white, size: 20,)
              ),
              label: "Chat",
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: ImageIcon(AssetImage("assets/images/chat-icon.png"), color: Color(0x90ffffff), size: 20,)
              )),
          BottomNavigationBarItem(
              activeIcon: InkWell(
                onTap: (){
                  _key.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.person, color: Colors.white, size: 20,)
                ),
              ),
              label: "Profile",
              icon: InkWell(
                onTap: (){
                  _key.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.person, color: Color(0x90ffffff), size: 20,)
                ),
              )),
        ],
      ),
    );
  }
}

