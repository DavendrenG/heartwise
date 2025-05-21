import 'dart:convert';

class BPEntry {
  final int systolic;
  final int diastolic;
  final int heartRate;
  final String? note;
  final DateTime timestamp;

  BPEntry({
    required this.systolic,
    required this.diastolic,
    required this.heartRate,
    this.note,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'systolic': systolic,
      'diastolic': diastolic,
      'heartRate': heartRate,
      'note': note,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory BPEntry.fromMap(Map<String, dynamic> map) {
    return BPEntry(
      systolic: map['systolic'],
      diastolic: map['diastolic'],
      heartRate: map['heartRate'],
      note: map['note'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  String toJson() => json.encode(toMap());
  factory BPEntry.fromJson(String source) =>
      BPEntry.fromMap(json.decode(source));
}
