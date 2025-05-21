import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/bp_provider.dart';
import 'services/notification_service.dart';
import 'screens/home_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
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
