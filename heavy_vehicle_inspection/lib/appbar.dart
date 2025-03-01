import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black54,
            size: 20,
          ),
        ),
        title: const Text(
          "My App",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
