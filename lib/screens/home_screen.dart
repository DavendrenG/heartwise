import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/bp_provider.dart';
import 'add_entry_screen.dart';
import 'history_screen.dart';
import 'tips_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _currentTip = 'Stay hydrated!';

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _fetchTip();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  Future<void> _fetchTip() async {
    // Implement your logic to fetch dynamic tips from a reliable source
    // For now, we'll use a placeholder
    setState(() {
      _currentTip = 'Remember to take deep breaths!';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return FadeTransition(
      opacity: _animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HeartWise',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            _currentTip,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildChart(BloodPressureProvider bp) {
    // Implement your chart using fl_chart or any other charting library
    // For now, we'll use a placeholder container
    return FadeTransition(
      opacity: _animation,
      child: Container(
        height: 200,
        color: Colors.blueAccent.withOpacity(0.1),
        child: Center(child: Text('Chart Placeholder')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bp = Provider.of<BloodPressureProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HeartWise Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.health_and_safety),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TipsScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.history),
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
            _buildHeader(),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: Text(
                    'Weekly Avg. Systolic: ${bp.getWeeklyAverageSystolic().toStringAsFixed(1)}'),
                subtitle: Text(
                    'Weekly Avg. Diastolic: ${bp.getWeeklyAverageDiastolic().toStringAsFixed(1)}'),
              ),
            ),
            const SizedBox(height: 16),
            _buildChart(bp),
            const SizedBox(height: 16),
            const Text('Welcome back! Tap + to add a new entry.')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddEntryScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
