import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ex1_todo_provider.g.dart';

/* 
  DESAFIO 1: O PROBLEMA DA IMUTABILIDADE
  
  Objetivo: Você quer adicionar uma tarefa à lista. 
  O código abaixo compila, mas a tela não atualiza quando você clica no botão.
  
  Por que? O Riverpod usa a comparação 'oldState == newState'. 
  Se você apenas altera o conteúdo da lista interna, a referência da lista 
  continua a mesma, e o Riverpod acha que nada mudou.
*/

@riverpod
class TodoList extends _$TodoList {
  @override
  List<String> build() => ['Estudar Flutter', 'Aprender Riverpod'];

  void addTodo(String task) {
    // CORRIJA AQUI: O erro está na forma como o estado é atualizado.
    // Dica: Você deve criar uma NOVA lista com os itens antigos + o novo.
    state = [...state, task];
  }
}
