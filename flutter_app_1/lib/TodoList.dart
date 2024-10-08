import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(
        20,
        (i) => Todo(
            'Todo $i', 'A description of what needs to be done for Todo $i'),
      ),
    ),
  ));
}

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => DetailScreen(todo: todos[index]),
                  builder: (context) => DetailScreen(),
                  // 将参数作为 RouteSettings 的一部分进行传递， DetailScreen 将会提取这些参数
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  // const DetailScreen({super.key, required this.todo});
  // final Todo todo;

  @override
  Widget build(BuildContext context) {
    // 使用 ModalRoute.of() 方法，它将会返回带有参数的当前路由。
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(
        //标题
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        //内容
        child: Text('DetailScreen:\n\n${todo.description}'),
      ),
    );
  }
}
