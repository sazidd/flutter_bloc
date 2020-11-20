part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final List<Post> posts;
  final int id;

  const TodoLoaded({@required this.todos, @required this.posts, this.id});
}

// class PostLoaded extends TodoState {
//   final List<Post> posts;

//   const PostLoaded({this.posts});
// }

class TodoError extends TodoState {
  final String errorMessage;

  const TodoError({this.errorMessage});
}
