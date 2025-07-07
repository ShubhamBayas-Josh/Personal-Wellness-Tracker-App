import 'package:flutter/material.dart';
import '../../widgets/activity_form.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Activity'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: EdgeInsets.all(isWide ? 32 : 20),
            child: const ActivityForm(),
          ),
        ),
      ),
    );
  }
}
