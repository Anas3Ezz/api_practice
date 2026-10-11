import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_project/todo/cubit/todo_cubit.dart';
import 'package:practice_project/todo/widgets/todo_tile.dart';
import '../widgets/add_task_sheet.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  void _openAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddTaskSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3EF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if (state is! TodoSucess || state.todos.isEmpty) {
                    return const Center(
                      child: Text(
                        'No tasks yet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF9A9A9A),
                        ),
                      ),
                    );
                  }

                  final todos = state.todos;
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: todos.length,
                    itemBuilder: (_, i) =>TodoTile(
                      item: todos[i],
  onTap: () => context.read<TodoCubit>().toogleStatus(i),
                     
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddSheet(context),
        backgroundColor: const Color(0xFF4A7C59),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 32, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Day',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C2C2C),
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '3 tasks remaining',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF9A9A9A),
            ),
          ),
        ],
      ),
    );
  }
}