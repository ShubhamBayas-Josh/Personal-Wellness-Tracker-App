import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/quote_card.dart';
import '../../widgets/task_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Timer _timer;
  DateTime _now = DateTime.now();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _handleNavigation(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/add');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('EEE, MMM d, yyyy').format(_now);
    final formattedTime = DateFormat('hh:mm:ss a').format(_now);
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _handleNavigation,
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.teal.shade50,
              leading: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Column(
                  children: [
                    Icon(Icons.favorite, size: 40, color: Colors.teal.shade700),
                    const SizedBox(height: 12),
                    const Text(
                      'Wellness',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_circle_outline),
                  label: Text('Add Activity'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.logout),
                  label: Text('Logout'),
                ),
              ],
            ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('DailyWellness'),
                centerTitle: true,
                elevation: 0,
                leading: isDesktop
                    ? null
                    : IconButton(
                  icon: const Icon(Icons.account_circle, size: 40),
                  onPressed: () {
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    tooltip: 'Logout',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade50, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 48 : 20,
                        vertical: 24,
                      ),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: isDesktop
                              ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Panel
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello, User 👋',
                                      style: theme.textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '$formattedDate | $formattedTime',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    const SizedBox(height: 24),
                                    const TaskList(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 32),
                              // Right Panel
                              Expanded(
                                child: Column(
                                  children: [
                                    const QuoteCard(),
                                    const SizedBox(height: 24),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/add');
                                        },
                                        icon: const Icon(Icons.add),
                                        label: const Text('Add Custom Activity'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                              : ListView(
                            children: [
                              Text(
                                'Hello, User 👋',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$formattedDate | $formattedTime',
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                              const TaskList(),
                              const SizedBox(height: 24),
                              const QuoteCard(),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/add');
                                },
                                icon: const Icon(Icons.add),
                                label: const Text('Add Custom Activity'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
