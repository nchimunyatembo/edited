import 'package:flutter/material.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoHome(),
    );
  }
}

class ToDoHome extends StatefulWidget {
  @override
  _ToDoHomeState createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final TextEditingController _taskController = TextEditingController();
  final List<String> _tasks = [];

  void _addTask() {
    final task = _taskController.text.trim();
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
        _taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  labelText: 'Enter a task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _addTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Button color
              ),
              child: const Text('Add Task'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(_tasks[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          'Prepared by NCHIMUNYA TEMBO App Solution',
        
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
