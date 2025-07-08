int countCompletedTasks(List<Map<String, dynamic>> tasks) {
  return tasks.where((task) => task['completed'] == true).length;
}
