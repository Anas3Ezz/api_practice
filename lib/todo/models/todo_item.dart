class TodoModel {
  final String title;
  final String? note;
   bool isDone;

   TodoModel({
    required this.title,
    this.note,
    this.isDone = false,
  });
}
