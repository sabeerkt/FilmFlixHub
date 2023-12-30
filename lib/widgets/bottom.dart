import 'package:flutter/material.dart';
import 'package:movie/view/home.dart';
import 'package:movie/view/search.dart';
import 'package:movie/view/show.dart';
import 'package:movie/view/tV.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> bottomBarPages = [
    const Home(),
    const search(),
    const tV(),
     ShowPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: bottomBarPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_sharp,
            

              color: Color.fromARGB(255, 85, 84, 84),
            ),
          ),
          BottomNavigationBarItem(
            label: "search",
            icon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 85, 84, 84),
            ),
          ),
          
          BottomNavigationBarItem(
            label: "tV",
            icon: Icon(
              Icons.tab,
              color: Color.fromARGB(255, 85, 84, 84),
            ),
          ),
          BottomNavigationBarItem(
            label: "show",
            icon: Icon(
             Icons.movie,
              color: Color.fromARGB(255, 85, 84, 84),
            ),
          ),
        ],
      ),
    );
  }
}