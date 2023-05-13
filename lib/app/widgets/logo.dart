import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.0,
      child: Column(
        children: const [
          Image(image: AssetImage('assets/chat-logo.jpg')),
          SizedBox(height: 24.0),
          Text(
            'Doctor Rent',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
