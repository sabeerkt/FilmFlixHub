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
            'assets/1.jpg',
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                elevation: 5.0, // Add some elevation for a subtle shadow effect
                primary: Color.fromARGB(255, 255, 255, 255),
                onPrimary: const Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              child: Text(
                "Login",
                style:
                    TextStyle(fontSize: 24), // Adjust the font size as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
