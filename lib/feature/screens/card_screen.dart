import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../entities/models/task_model.dart';

import '../../services/setting/app_style.dart';


class TaskCardScreen extends StatefulWidget {
  const TaskCardScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskCardScreen> createState() => _TaskCardScreenState();
}

class _TaskCardScreenState extends State<TaskCardScreen> {
  // ignore: non_constant_identifier_names
  int color_id = Random().nextInt(AppStyle.cardColor.length);
  String date =
      DateFormat().add_yMMMMd().add_Hms().format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text(
          widget.task.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppStyle.cardColor[color_id],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task.title,
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                date,
                style: AppStyle.dateTitle,
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                widget.task.description,
                style: AppStyle.mainContent,
                overflow: TextOverflow.ellipsis,
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
