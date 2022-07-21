import 'package:flutter/material.dart';




import '../../../commons/blocs_export.dart';
import '../../../entities/models/task_model.dart';
import '../../../services/setting/guid_gen.dart';


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleContronller = TextEditingController();
    TextEditingController descriptionContronller = TextEditingController();
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Add Task",
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
                      var task = Task(
                        title: titleContronller.text,
                        description: descriptionContronller.text,
                        id: GUIDGen.generate(),
                        date: DateTime.now().toString(),
                      );
                      context.read<TaskBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
