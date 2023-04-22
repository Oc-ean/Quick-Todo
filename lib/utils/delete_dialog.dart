import 'package:flutter/material.dart';

class TodoDeleteBox extends StatelessWidget {
  final dynamic onPressed;
  const TodoDeleteBox({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Todo'),
      content: const Text('Are you sure you want to delete this?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
