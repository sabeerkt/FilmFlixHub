import 'package:flutter/material.dart';
import 'package:movie/controller/bottm_provider.dart';
import 'package:movie/view/home.dart';
import 'package:movie/view/search.dart';
import 'package:movie/view/show.dart';
import 'package:movie/view/tV.dart';
import 'package:provider/provider.dart';




class BottomBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: provider.currentIndex,
        children:  [
          Home(),
          search(),
          tV(),
          ShowPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        onTap: (i) => provider.setIndex(i),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: "TV",
            icon: Icon(
              Icons.tab,
            ),
          ),
          BottomNavigationBarItem(
            label: "Show",
            icon: Icon(
              Icons.movie,
            ),
          ),
        ],
      ),
    );
  }
}
