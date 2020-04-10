import 'package:mobx/mobx.dart';

class Counter {
  Observable _count = Observable(0);
  Action increment;
  
  Counter(){
    increment = Action(_increment);
  }

  int get count => _count.value;

  
  void _increment(){
    _count.value++;
  }
}