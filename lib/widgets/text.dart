import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 20.0,
          color: const Color.fromARGB(
              255, 255, 255, 255), // Set the text color to black
          fontWeight: FontWeight.bold, // You can adjust the font weight
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('FlixHub',
                speed: const Duration(milliseconds: 300)),
          ],
        ),
      ),
    );
  }
}
