import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bp_entry.dart';
import '../services/bp_provider.dart';

class AddEntryScreen extends StatefulWidget {
  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  int? systolic;
  int? diastolic;
  int? heartRate;
  String? note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Systolic'),
                onSaved: (val) => systolic = int.tryParse(val ?? ''),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter systolic value' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Diastolic'),
                onSaved: (val) => diastolic = int.tryParse(val ?? ''),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter diastolic value' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Heart Rate'),
                onSaved: (val) => heartRate = int.tryParse(val ?? ''),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter heart rate' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Optional Note'),
                onSaved: (val) => note = val,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final entry = BPEntry(
                      systolic: systolic!,
                      diastolic: diastolic!,
                      heartRate: heartRate!,
                      note: note,
                      timestamp: DateTime.now(),
                    );
                    Provider.of<BloodPressureProvider>(context, listen: false)
                        .addEntry(entry);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
