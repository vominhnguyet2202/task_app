import 'package:flutter/material.dart';

import '../../entities/models/task_model.dart';




class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallBack;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  final Task task;

  const PopupMenu(
      {Key? key,
      required this.cancelOrDeleteCallBack,
      required this.task,
      required this.likeOrDislike,
      required this.editTaskCallback,
      required this.restoreTaskCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: editTaskCallback,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    onTap: null,
                  ),
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavourite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavourite == false
                          ? const Text('Add the \nBookmarks')
                          : const Text("Remove from \nBookmarks"),
                    ),
                    onTap: likeOrDislike,
                  ),
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                    onTap: cancelOrDeleteCallBack,
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: restoreTaskCallback,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    ),
                    onTap: null,
                  ),
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text(' Delete Forever'),
                    ),
                    onTap: cancelOrDeleteCallBack,
                  ),
                ]);
  }
}
