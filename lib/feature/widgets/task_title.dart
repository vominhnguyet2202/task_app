import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commons/blocs_export.dart';
import '../../entities/models/task_model.dart';
import '../screens/all_task_screen/edit_task_screen.dart';
import '../screens/card_screen.dart';
import 'popup_menu.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeletedTask(task: task))
        : context.read<TaskBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(
            oldTask: task,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavourite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Text(
                          task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TaskCardScreen(task: task)));
                        },
                      ),
                      Text(
                        DateFormat()
                            .add_yMMMMd()
                            .add_Hms()
                            .format(DateTime.now())
                            .toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TaskBloc>().add(UpdateTask(task: task));
                    }
                  : null,
            ),
            PopupMenu(
                task: task,
                cancelOrDeleteCallBack: () =>
                    _removeOrDeleteTask(context, task),
                likeOrDislike: () => context.read<TaskBloc>().add(
                      MarkFavouriteOrUnfavouriteTask(task: task),
                    ),
                editTaskCallback: () {
                  Navigator.of(context).pop();
                  _editTask(context);
                },
                restoreTaskCallback: () {
                  context.read<TaskBloc>().add(RestoreTask(task: task));
                  Navigator.of(context).pop();
                }),
          ]),
        ],
      ),
    );
  }
}



/*
ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TaskBloc>().add(UpdateTask(task: task));
              }
            : null,
      ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
*/