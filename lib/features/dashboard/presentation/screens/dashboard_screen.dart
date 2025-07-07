import 'package:flutter/material.dart';
import '../../widgets/quote_card.dart';
import '../../widgets/task_list.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEE, MMM d, yyyy').format(now);
    final formattedTime = DateFormat('hh:mm a').format(now);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        return Scaffold(
          body: Row(
            children: [
              // Sidebar (only for desktop)
              if (isDesktop)
                NavigationRail(
                  selectedIndex: 0,
                  onDestinationSelected: (int index) {},
                  backgroundColor: Colors.teal.shade50,
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.add),
                      label: Text('Add Activity'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                ),

              // Main Content Area
              Expanded(
                child: Scaffold(
                  appBar: !isDesktop
                      ? AppBar(
                    title: const Text('DailyWellness'),
                    backgroundColor: Colors.teal,
                  )
                      : null,
                  body: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 48 : 20,
                          vertical: 24,
                        ),
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
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '$formattedDate | $formattedTime',
                                    style: Theme.of(context).textTheme.bodyMedium,
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
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$formattedDate | $formattedTime',
                              style: Theme.of(context).textTheme.bodyMedium,
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
            ],
          ),
        );
      },
    );
  }
}
