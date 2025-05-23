import 'package:http/http.dart' as http;
import 'dart:convert';

class TipService {
  Future<String> fetchHealthTip() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/healthtip'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['tip'];
    } else {
      throw Exception('Failed to load health tip');
    }
  }
}
