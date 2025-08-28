import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/menu_screen.dart';
import 'package:myapp/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int qty = 0;
  int currentIndex = 0;
  late final PageController _controller = PageController(
    initialPage: currentIndex,
  );

  @override
  void initState() {
    super.initState();
    qty = 1;
  }

  // void increase() {
  //   setState(() {
  //     qty++;
  //   });
  // }

  // void decrease() {
  //   setState(() {
  //     if (qty > 1) {
  //       qty--;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeScreen(), ProfileScreen(), MenuScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _controller.animateToPage(
            currentIndex,
            duration: Duration(milliseconds: 350),
            curve: Curves.linear,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            activeIcon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
