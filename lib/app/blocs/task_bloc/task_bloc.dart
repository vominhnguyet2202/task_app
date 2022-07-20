// ignore: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

import '../../../entities/models/task_model.dart';
import '../../../commons/blocs_export.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super((const TaskState())) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeletedTask>(_onDeletedTask);
    on<RemoveTask>(_onRemoveTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
    on<MarkFavouriteOrUnfavouriteTask>(_onMarkFavouriteOrUnfavouriteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        pendingTask: List.from(state.pendingTask)..add(event.task),
        completedTask: state.completedTask,
        favouriteTask: state.favouriteTask,
        removeTask: state.removeTask,
      ),
    );
  }

  void _onEditTask(EditTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> favouriteTask = state.favouriteTask;
    if (event.oldTask.isFavourite == true) {
      favouriteTask
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(
      TaskState(
        pendingTask: List.from(state.pendingTask)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        completedTask: state.completedTask..remove(event.oldTask),
        favouriteTask: favouriteTask,
        removeTask: state.removeTask,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask = state.completedTask;
    List<Task> favouriteTask = state.favouriteTask;
    if (task.isDone == false) {
      if (task.isFavourite == false) {
        pendingTask = List.from(pendingTask)..remove(task);
        completedTask.insert(0, task.copyWith(isDone: true));
      } else {
        var taskIndex = favouriteTask.indexOf(task);
        pendingTask = List.from(pendingTask)..remove(task);
        completedTask.insert(0, task.copyWith(isDone: true));
        favouriteTask = List.from(favouriteTask)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavourite == false) {
        completedTask = List.from(completedTask)..remove(task);
        pendingTask = List.from(pendingTask)
          ..insert(0, task.copyWith(isDone: false));
      } else {
        var taskIndex = favouriteTask.indexOf(task);
        completedTask = List.from(completedTask)..remove(task);
        pendingTask = List.from(pendingTask)
          ..insert(0, task.copyWith(isDone: false));

        favouriteTask = List.from(favouriteTask)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: false));
      }
    }

    emit(TaskState(
        pendingTask: pendingTask,
        completedTask: completedTask,
        favouriteTask: favouriteTask,
        removeTask: state.removeTask));
  }

  void _onDeletedTask(DeletedTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pendingTask: state.pendingTask,
      completedTask: state.completedTask,
      favouriteTask: state.favouriteTask,
      removeTask: List.from(state.removeTask)..remove(event.task),
      // removeTask: List.from(state.removeTask)..removeWhere((Task currentTask) => TaskState == currentTask)
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pendingTask: List.from(state.pendingTask)..remove(event.task),
      completedTask: List.from(state.completedTask)..remove(event.task),
      favouriteTask: List.from(state.favouriteTask)..remove(event.task),
      removeTask: List.from(state.removeTask)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onMarkFavouriteOrUnfavouriteTask(
      MarkFavouriteOrUnfavouriteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask = state.completedTask;
    List<Task> favouriteTask = state.favouriteTask;

    if (event.task.isDone == false) {
      if (event.task.isFavourite == false) {
        var taskIndex = pendingTask.indexOf(event.task);
        pendingTask = List.from(pendingTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        favouriteTask.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        var taskIndex = pendingTask.indexOf(event.task);
        pendingTask = List.from(pendingTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        favouriteTask.remove(event.task);
      }
    } else {
      if (event.task.isFavourite == false) {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask = List.from(completedTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        favouriteTask.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask = List.from(completedTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        favouriteTask.remove(event.task);
      }
    }
    emit(TaskState(
      pendingTask: pendingTask,
      completedTask: completedTask,
      favouriteTask: favouriteTask,
      removeTask: state.removeTask,
    ));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      removeTask: List.from(state.removeTask)..remove(event.task),
      pendingTask: List.from(state.pendingTask)
        ..insert(
            0,
            event.task
                .copyWith(isDeleted: false, isDone: false, isFavourite: false)),
      completedTask: state.completedTask,
      favouriteTask: state.favouriteTask,
    ));
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      removeTask: List.from(state.removeTask)..clear(),
      pendingTask: state.pendingTask,
      completedTask: state.completedTask,
      favouriteTask: state.favouriteTask,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
