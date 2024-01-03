import 'package:flutter/material.dart';
import 'package:movie/widgets/bottom.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/spalsh.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20, // Adjust the bottom margin as needed
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => BottomBarContent()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 0, 0),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
