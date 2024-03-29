import 'package:flutter/material.dart';

import '../../../commons/blocs_export.dart';
import '../../../entities/models/task_model.dart';
import '../../../widgets/task_list.dart';


// ignore: must_be_immutable
class CompletedScreen extends StatelessWidget {
  CompletedScreen({super.key});
  static const id = 'task_screen';

  TextEditingController titleContronller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${taskList.length} Task'),
              ),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
