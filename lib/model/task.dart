import 'package:flutter/material.dart';

@immutable
class Task {
  final int id;
  final String title;
  final String description;
  final bool completed;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    this.completed = false,
  });

  Task copyWith({bool? completed}) {
    return Task(
      id: id,
      title: title,
      description: description,
      completed: completed ?? this.completed,
    );
  }
}