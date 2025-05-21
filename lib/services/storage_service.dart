import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<List<String>> getEntries() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('bp_entries') ?? [];
  }

  Future<void> deleteEntry(int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> entries = prefs.getStringList('bp_entries') ?? [];
    if (index >= 0 && index < entries.length) {
      entries.removeAt(index);
      await prefs.setStringList('bp_entries', entries);
    }
  }
}
