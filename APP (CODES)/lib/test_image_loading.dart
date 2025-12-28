import 'package:flutter/material.dart';

void main() {
  runApp(const TestImageApp());
}

class TestImageApp extends StatelessWidget {
  const TestImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Loading Test')),
        body: ListView(
          children: [
            const Text(
              'Testing kitten.jpg:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/cinecine/kitten.jpg',
              height: 400,
              errorBuilder: (context, error, stack) {
                return Container(
                  height: 400,
                  color: Colors.red,
                  child: const Center(child: Text('Failed to load kitten.jpg')),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Testing block.jpg:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/cinecine/block.jpg',
              height: 400,
              errorBuilder: (context, error, stack) {
                return Container(
                  height: 400,
                  color: Colors.red,
                  child: const Center(child: Text('Failed to load block.jpg')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
