// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> favouriteTask;
  final List<Task> removeTask;
  const TaskState({
    this.pendingTask = const <Task>[],
    this.completedTask = const <Task>[],
    this.favouriteTask = const <Task>[],
    this.removeTask = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTask, removeTask, completedTask, favouriteTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTask': pendingTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favouriteTask': favouriteTask.map((x) => x.toMap()).toList(),
      'removeTask': removeTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTask:
          List<Task>.from((map['pendingTask']?.map((x) => Task.fromMap(x)))),
      completedTask:
          List<Task>.from((map['completedTask']?.map((x) => Task.fromMap(x)))),
      favouriteTask:
          List<Task>.from((map['favouriteTask']?.map((x) => Task.fromMap(x)))),
      removeTask:
          List<Task>.from((map['removeTask']?.map((x) => Task.fromMap(x)))),
    );
  }
}
