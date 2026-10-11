import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import '../widgets/add_task_sheet.dart';
import '../widgets/todo_tile.dart';

const _tasks = [
  TodoItem(title: 'Morning walk', note: '30 minutes'),
  TodoItem(title: 'Read a chapter', note: 'Atomic Habits'),
  TodoItem(title: 'Drink 8 glasses of water'),
];

const _done = [
  TodoItem(title: 'Stretch for 10 minutes', isDone: true),
  TodoItem(title: 'Write in journal', isDone: true),
];

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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            _buildSectionLabel('Tasks'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => TodoTile(item: _tasks[i]),
                childCount: _tasks.length,
              ),
            ),
            _buildSectionLabel('Completed'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => TodoTile(item: _done[i]),
                childCount: _done.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
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

  Widget _buildHeader() {
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

  SliverToBoxAdapter _buildSectionLabel(String label) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFFAAAAAA),
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
