import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/bp_entry.dart';

class BloodPressureProvider extends ChangeNotifier {
  List<BPEntry> _entries = [];
  List<BPEntry> get entries => _entries;

  Future<void> loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('bp_entries') ?? [];
    _entries = data.map((e) => BPEntry.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> addEntry(BPEntry entry) async {
    _entries.add(entry);
    await _saveEntries();
    notifyListeners();
  }

  Future<void> _saveEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _entries.map((e) => e.toJson()).toList();
    await prefs.setStringList('bp_entries', data);
  }

  double getWeeklyAverageSystolic() {
    final now = DateTime.now();
    final last7Days =
        _entries.where((e) => now.difference(e.timestamp).inDays < 7);
    if (last7Days.isEmpty) return 0;
    return last7Days.map((e) => e.systolic).reduce((a, b) => a + b) /
        last7Days.length;
  }

  double getWeeklyAverageDiastolic() {
    final now = DateTime.now();
    final last7Days =
        _entries.where((e) => now.difference(e.timestamp).inDays < 7);
    if (last7Days.isEmpty) return 0;
    return last7Days.map((e) => e.diastolic).reduce((a, b) => a + b) /
        last7Days.length;
  }

  List<BPEntry> getEntriesForLast7Days() {
    final now = DateTime.now();
    return _entries
        .where((e) => now.difference(e.timestamp).inDays < 7)
        .toList();
  }
}
