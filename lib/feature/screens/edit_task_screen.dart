import 'package:flutter/material.dart';


import '../../commons/blocs_export.dart';
import '../../entities/models/task_model.dart';


class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({
    Key? key, required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleContronller = TextEditingController(text: oldTask.title);
    TextEditingController descriptionContronller = TextEditingController(text: oldTask.description);
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Edit Task",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                autofocus: true,
                controller: titleContronller,
                decoration: const InputDecoration(
                    label: Text("Title"), border: OutlineInputBorder()),
              ),
            ),
            TextField(
              autofocus: true,
              controller: descriptionContronller,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                  label: Text("Description"), border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                    onPressed: () {
                      var editTask = Task(
                        title: titleContronller.text,
                        description: descriptionContronller.text,
                        id: oldTask.id,
                        isDone: false,
                        isFavourite: oldTask.isFavourite,
                        date: DateTime.now().toString(),
                      );
                      context.read<TaskBloc>().add(EditTask(oldTask: oldTask, newTask: editTask));
                      Navigator.pop(context);
                    },
                    child: const Text("Save"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
