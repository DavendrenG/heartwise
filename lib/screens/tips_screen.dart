import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  final List<String> tips = [
    'Maintain a low-sodium diet.',
    'Exercise regularly.',
    'Monitor your blood pressure consistently.',
    'Reduce stress through meditation or relaxation techniques.',
    'Avoid smoking and limit alcohol consumption.',
    'Take your prescribed medication consistently.',
    'Eat more fruits and vegetables.',
    'Get enough quality sleep.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Health Tips')),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text(tips[index]),
        ),
      ),
    );
  }
}
