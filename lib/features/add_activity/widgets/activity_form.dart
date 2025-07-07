import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dashboard/data/providers/task_provider.dart';
import '../../dashboard/data/task_model.dart';

class ActivityForm extends ConsumerStatefulWidget {
  const ActivityForm({super.key});

  @override
  ConsumerState<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends ConsumerState<ActivityForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();

  void _saveActivity() {
    if (_formKey.currentState!.validate()) {
      final newTask = TaskModel(
        name: _nameController.text.trim(),
        notes: _notesController.text.trim().isNotEmpty
            ? _notesController.text.trim()
            : null,
      );

      // Add the new task to the Riverpod state
      ref.read(taskProvider.notifier).addTask(newTask);

      // Show confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Activity "${newTask.name}" added!'),
          backgroundColor: Colors.teal,
        ),
      );

      // Navigate back
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Wellness Activity',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          /// Activity Name Field
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Activity Name',
              prefixIcon: Icon(Icons.fitness_center),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter an activity name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          /// Notes Field (Optional)
          TextFormField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              prefixIcon: Icon(Icons.note_alt_outlined),
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),

          /// Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _saveActivity,
              icon: const Icon(Icons.save),
              label: const Text('Save Activity'),
            ),
          ),
        ],
      ),
    );
  }
}
