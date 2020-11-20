import 'package:bloc_n/data/repositories/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/todo_bloc.dart';
import 'ui/pages/homePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoBloc(
            todorepository: TodoRepository(),
            postRepository: PostRepository(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());

//        MultiProvider(
//      providers: [
//        ChangeNotifierProvider(
//          create: (context) => TodoBloc(
//              todorepository: TodoRepository(),
//              postRepository: PostRepository()),
//        ),
//        // BlocProvider(
//        //   create: (context) => PostBloc(repository: PostRepository()),
//        // ),
//      ],
//      child: HomePage(),
//    ));
  }
}
