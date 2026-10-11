part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoSucess extends TodoState {
  final List<TodoModel> todos ;

  TodoSucess(this.todos);
}

final class Todoempty extends TodoState {}


