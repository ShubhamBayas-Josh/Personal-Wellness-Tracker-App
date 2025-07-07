import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../task_model.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([
    TaskModel(name: '💧 Drink Water'),
    TaskModel(name: '🧘 Meditate for 10 mins'),
    TaskModel(name: '🚶 Walk 5,000 steps'),
  ]);

  void addTask(TaskModel task) {
    state = [...state, task];
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) {
  return TaskNotifier();
});
