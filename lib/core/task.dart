class Task {
  Task(
      {required this.title,
      required this.description,
      required this.id,
      required this.date,
      required this.isDone});

  final String title;
  final int id;
  final String description;
  final DateTime date;
  final bool isDone;
}
