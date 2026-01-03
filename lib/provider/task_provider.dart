import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/model/task.dart';

part 'task_provider.g.dart';

@riverpod
class TaskProvider extends _$TaskProvider {
  @override
  List<Task> build() {
    return [
      Task(
        id: 1,
        title: "Estudar Flutter",
        description: "Completar o curso de Flutter no Udemy",
      ),
      Task(
        id: 2,
        title: "Fazer compras",
        description: "Comprar frutas, vegetais e leite",
      ),
      Task(
        id: 3,
        title: "Exercitar-se",
        description: "Correr por 30 minutos no parque",
      ),
    ];
    
  }

  void toggleCompleted() {
    state = state.map((task) {
      if (task.id == state.first.id) {
        return task.copyWith(completed: !task.completed);
      }
      return task;
    }).toList();
  }

  void addTask(String title, String description){
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
    );

    state = [...state, newTask];
  }

  void removeTask(int id){
    state = state.where((task) => task.id != id).toList();
  }

  List<Task> get completedTasks {
    return state.where((task) => task.completed).toList();
  }
}