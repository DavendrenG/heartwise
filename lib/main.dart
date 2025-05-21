import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/bp_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(HeartWiseApp());
}

class HeartWiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BloodPressureProvider(),
      child: MaterialApp(
        title: 'HeartWise',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.redAccent,
          colorScheme: ColorScheme.dark(),
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
