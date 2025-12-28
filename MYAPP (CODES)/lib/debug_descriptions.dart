import 'package:flutter/material.dart';
import 'screens/class_info_screen.dart';
import 'providers/classification_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DebugDescriptionsApp());
}

class DebugDescriptionsApp extends StatelessWidget {
  const DebugDescriptionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClassificationProvider(),
      child: MaterialApp(home: const DebugScreen()),
    );
  }
}

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Descriptions')),
      body: Consumer<ClassificationProvider>(
        builder: (context, provider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Debug Information:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Show class labels from provider
              Text(
                'Provider classLabels: ${provider.classLabels}',
                style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
              ),

              const SizedBox(height: 10),

              // Show description keys
              Text(
                'Description keys: ${shoeClassDescriptions.keys.toList()}',
                style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
              ),

              const SizedBox(height: 20),

              // Test each description
              const Text(
                'Testing descriptions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              ...shoeClassDescriptions.keys.map((key) {
                final description = shoeClassDescriptions[key];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$key: ${description ?? "MISSING"}',
                      style: TextStyle(
                        fontSize: 12,
                        color: description != null ? Colors.green : Colors.red,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                );
              }),

              const SizedBox(height: 20),

              // Test image paths
              const Text(
                'Testing images:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              ...shoeClassImages.keys.map((key) {
                final imagePath = shoeClassImages[key];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$key: ${imagePath ?? "MISSING"}',
                      style: TextStyle(
                        fontSize: 12,
                        color: imagePath != null ? Colors.blue : Colors.red,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
