import 'package:flutter/material.dart';
import '../../commons/blocs_export.dart';
import '../../entities/models/task_model.dart';
import '../../widgets/task_list.dart';

// ignore: must_be_immutable
class PendingScreen extends StatelessWidget {
  PendingScreen({super.key});
  static const id = 'task_screen';

  TextEditingController titleContronller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                    '${taskList.length} Pending | ${state.completedTask.length} Completed'),
              ),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
