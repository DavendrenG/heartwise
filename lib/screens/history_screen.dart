import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/bp_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entries = Provider.of<BloodPressureProvider>(context).entries;

    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[entries.length - 1 - index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              title: Text('${entry.systolic}/${entry.diastolic} mmHg'),
              subtitle: Text('HR: ${entry.heartRate} bpm\n${entry.note ?? ''}'),
              trailing: Text(
                '${entry.timestamp.day}/${entry.timestamp.month} ${entry.timestamp.hour}:${entry.timestamp.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 12),
              ),
            ),
          );
        },
      ),
    );
  }
}
