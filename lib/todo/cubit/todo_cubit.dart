import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_project/todo/models/todo_item.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final List<TodoModel> todos = [];


void addTodo(String title , String note ){
  final newTodo = TodoModel(title: title , note: note);
 todos.add(newTodo);
 emit(TodoSucess(todos));
}

void toogleStatus (int index) {
  todos[index].isDone = !todos[index].isDone;
 emit(TodoSucess(todos));
}
  
}
