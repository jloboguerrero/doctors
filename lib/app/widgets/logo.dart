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
          Text(
            'Chat App',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
