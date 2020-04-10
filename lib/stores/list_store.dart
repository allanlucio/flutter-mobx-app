import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store{
  @observable
  String newTodoTitle = "";

  @observable
  ObservableList<String> todoList = ObservableList<String>();

  @action
  void setNewTodoTitle(String value) => newTodoTitle=value;

  @action
  void addTodo(){
    todoList.add(newTodoTitle);
    
  }

  @computed
  bool get isToDoTitleValid => newTodoTitle.isNotEmpty;

  

}