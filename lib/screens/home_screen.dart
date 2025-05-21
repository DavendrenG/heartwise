import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/bp_provider.dart';
import 'add_entry_screen.dart';
import 'history_screen.dart';
import 'tips_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bp = Provider.of<BloodPressureProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('HeartWise'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.health_and_safety),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TipsScreen()),
            ),
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text(
                    'Weekly Avg. Systolic: ${bp.getWeeklyAverageSystolic().toStringAsFixed(1)}'),
                subtitle: Text(
                    'Weekly Avg. Diastolic: ${bp.getWeeklyAverageDiastolic().toStringAsFixed(1)}'),
              ),
            ),
            SizedBox(height: 16),
            Text('Welcome back! Tap + to add a new entry.')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddEntryScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
