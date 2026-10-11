class TodoItem {
  final String title;
  final String? note;
  final bool isDone;

  const TodoItem({
    required this.title,
    this.note,
    this.isDone = false,
  });
}
