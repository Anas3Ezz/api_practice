import 'package:flutter/material.dart';
import 'package:practice_project/todo/models/todo_item.dart';

class TodoTile extends StatelessWidget {
  final TodoModel item;
  final void Function() onTap;

  const TodoTile({super.key, required this.item, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: item.isDone ? const Color(0xFFF0EEE9) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: item.isDone
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
        
            children: [
              GestureDetector(
                onTap: onTap,
                child: _TodoCheckbox(isDone: item.isDone,)),
                SizedBox(width: 20,),
              Expanded(child: _TodoContent(item: item)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodoCheckbox extends StatelessWidget {
  const _TodoCheckbox({required this.isDone,});

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDone ? const Color(0xFF4A7C59) : Colors.transparent,
        border: Border.all(
          color: isDone ? const Color(0xFF4A7C59) : const Color(0xFFCCCCCC),
          width: 2,
        ),
      ),
      child: isDone ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
    );
  }
}

class _TodoContent extends StatelessWidget {
  const _TodoContent({required this.item});

  final TodoModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: item.isDone ? const Color(0xFFAAAAAA) : const Color(0xFF2C2C2C),
            decoration: item.isDone ? TextDecoration.lineThrough : null,
            decorationColor: const Color(0xFFAAAAAA),
          ),
        ),
        if (item.note != null) ...[
          const SizedBox(height: 2),
          Text(
            item.note!,
            style: TextStyle(
              fontSize: 13,
              color: item.isDone ? const Color(0xFFCCCCCC) : const Color(0xFF9A9A9A),
            ),
          ),
        ],
      ],
    );
  }
}
