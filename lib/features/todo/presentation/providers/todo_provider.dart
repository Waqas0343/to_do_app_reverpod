import 'package:flutter_riverpod/legacy.dart';
import '../data/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(id: DateTime.now().toString(), title: title);
    state = [...state, todo];
  }

  void updateTodo(String id, String newTitle) {
    state = [
      for (final todo in state)
        if (todo.id == id) TodoModel(id: id, title: newTitle) else todo
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>(
      (ref) => TodoNotifier(),
);