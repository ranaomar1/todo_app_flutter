import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TaskApp()); ///////////////////jkhlihoj'j
  //kjblnl//jhbihuo
  //iuhbuo
}

//hkbkbli
class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      home: const HomeScreen(),
    ); //MaterialApp
  }
}
