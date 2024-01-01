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
            'assets/spiderman.jpg',
            fit: BoxFit.cover, // Ensure the image covers the entire screen
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the home screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BottomBarContent()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Dark button color
                  onPrimary: Colors.white, // White text color
                  padding: EdgeInsets.symmetric(horizontal: 20), // Medium width
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
