import 'package:flutter/material.dart';

import '../../../commons/blocs_export.dart';

import '../../../widgets/task_list.dart';
import '../my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = "task_recycle_bin_screen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Recycle Bin"),
            elevation: 0.0,
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.delete_forever),
                            label: const Text("Delete All Task"),
                          ),
                          onTap: () =>
                              context.read<TaskBloc>().add(DeleteAllTask()),
                        )
                      ])
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removeTask.length}Task'),
                ),
              ),
              TaskList(taskList: state.removeTask)
            ],
          ),
        );
      },
    );
  }
}
