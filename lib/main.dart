import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<String> tasks = [];

  void createTask(String title) {
    if (title.isEmpty) {
      throw Exception('Título requerido');
    }

    tasks.add(title);

    // Guardar localmente
    SharedPreferences.getInstance().then((preferences) {
      preferences.setStringList('tasks', tasks);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTask('Tarea ${tasks.length + 1}');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          return ListTile(title: Text(tasks[index]));
        },
      ),
    );
  }
}
