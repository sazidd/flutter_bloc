import 'package:bloc_n/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = context.read<TodoBloc>();
    todoBloc.add(FetchTodos());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoBloc>(context, listen: false).addMajorOne("Karim");
    });

    // Provider.of<TodoBloc>(context, listen: false).addMajorOne("Karim");
    //todoBloc.add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Column(
        children: [
          Text("${Provider.of<TodoBloc>(context).majorOneName}"),
          BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
            if (state is TodoInitial) {
              return Expanded(
                child: Center(
                  child: Text("Please Wait"),
                ),
              );
            } else if (state is TodoLoading) {
              return Expanded(
                child: Center(
                  child: Text("Please Wait"),
                ),
              );
            } else if (state is TodoLoaded) {
              return state.todos[1].id == state.todos[0].id
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: state.todos.length,
                          itemBuilder: (context, index) {
                            final todo = state.todos[index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text('${todo.id}'),
                                ),
                                title: Text(todo.title),
                              ),
                            );
                          }),
                    )
                  : Center(
                      child: Text(
                        "${state.id}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    );
            } else if (state is TodoError) {
              return Center(child: Text(state.errorMessage));
            }
          }),

          // Expanded(child:
          //     BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          //   if (state is TodoInitial) {
          //     return Center(
          //       child: Text("Please Wait"),
          //     );
          //   } else if (state is TodoLoading) {
          //     return Center(
          //       child: Text("Please Wait"),
          //     );
          //   } else if (state is TodoLoaded) {
          //     return Text("${state.id}");
          //   } else if (state is TodoError) {
          //     return Center(child: Text(state.errorMessage));
          //   }
          // })),
          // Expanded(
          //   child: BlocBuilder<TodoBloc, TodoState>(
          //     builder: (context, state) {
          //       if (state is TodoInitial) {
          //         return Center(child: CircularProgressIndicator());
          //       } else if (state is TodoLoading) {
          //         return Center(child: CircularProgressIndicator());
          //       } else if (state is TodoLoaded) {
          //         return Column(
          //           children: [
          //             Expanded(
          //               child: ListView.builder(
          //                 //itemCount: state.todos.length,
          //                 itemCount: state.todos.length,
          //                 itemBuilder: (context, index) {
          //                   final todo = state.todos[index];
          //                   return Card(
          //                     child: ListTile(
          //                       leading: CircleAvatar(
          //                         child: Text('${todo.id}'),
          //                       ),
          //                       title: Text(todo.title),
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //         );
          //       } else if (state is TodoError) {
          //         return Center(
          //           child: Text(state.errorMessage),
          //         );
          //       }
          //     },
          //   ),
          // ),

          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TodoLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          //itemCount: state.todos.length,
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            final post = state.posts[index];
                            return Card(
                              color: Colors.red,
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text('${post.id}'),
                                ),
                                title: Text(post.body),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is TodoError) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
