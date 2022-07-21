import 'package:flutter/material.dart';
import 'package:task_app/services/setting/sizeconfig.dart';


import '../../commons/blocs_export.dart';

import 'task_screens/recycle_bin.dart';
import 'tab_screens/tab_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: getsizeWidth(20), vertical: getsizeHeight(14)),
            color: Colors.grey,
            child: Text(
              "Task Drawer",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: (() =>
                    Navigator.of(context).pushReplacementNamed(TabScreen.id)),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text(
                      '${state.pendingTask.length} | ${state.completedTask.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: (() =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id)),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text("${state.removeTask.length}"),
                ),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          )
        ],
      )),
    );
  }
}
