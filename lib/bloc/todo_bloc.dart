import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_n/data/models/post.dart';
import 'package:bloc_n/data/models/todo.dart';
import 'package:bloc_n/data/repositories/main_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> with ChangeNotifier {
  final TodoRepository todorepository;
  final PostRepository postRepository;

  TodoBloc({@required this.todorepository, @required this.postRepository})
      : super(TodoInitial());

  String majorOneName = '';

  addMajorOne(String majorOneNameTemp) {
    majorOneName = majorOneNameTemp;
    notifyListeners();
  }

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is FetchTodos) {
      yield TodoLoading();

      try {
        List<Todo> todos = await todorepository.getData();
        List<Post> posts = await postRepository.getData();
        final id = todos[1].id;
        yield TodoLoaded(
          todos: todos,
          posts: posts,
          id: id,
        );
        //yield PostLoaded(posts: posts);
      } on NetworkException {
        yield TodoError(
            errorMessage: 'Couldn\'t fetch todos. Is the device online?');
      } catch (e) {
        yield TodoError(errorMessage: e.toString());
      }
    }
  }
}
