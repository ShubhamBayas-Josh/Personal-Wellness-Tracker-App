import 'package:flutter_test/flutter_test.dart';
import 'package:wellness_app/utils/task_utils.dart';

void main() {
  group('countCompletedTasks()', () {
    test('returns 0 for empty task list', () {
      expect(countCompletedTasks([]), 0);
    });

    test('returns count when some tasks are completed', () {
      final tasks = [
        {'title': 'Yoga', 'completed': true},
        {'title': 'Read book', 'completed': false},
        {'title': 'Meditate', 'completed': true},
      ];
      expect(countCompletedTasks(tasks), 2);
    });

    test('returns 0 when no tasks are completed', () {
      final tasks = [
        {'title': 'Walk', 'completed': false},
        {'title': 'Breathe', 'completed': false},
      ];
      expect(countCompletedTasks(tasks), 0);
    });

    test('returns total when all tasks are completed', () {
      final tasks = [
        {'title': 'Drink water', 'completed': true},
        {'title': 'Stretch', 'completed': true},
      ];
      expect(countCompletedTasks(tasks), 2);
    });
  });
}
