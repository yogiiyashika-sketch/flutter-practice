import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/thought.dart';

class ThoughtService {
  static const String _storageKey = 'thoughts';

  final List<Thought> _thoughts = [];

  // Load saved thoughts
  Future<void> loadThoughts() async {
    final prefs = await SharedPreferences.getInstance();

    final savedData = prefs.getStringList(_storageKey);

    if (savedData == null) {
      return;
    }

    _thoughts.clear();

    for (final item in savedData) {
      final jsonData = jsonDecode(item) as Map<String, dynamic>;
      _thoughts.add(Thought.fromJson(jsonData));
    }
  }

  // Save thoughts to device
  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final data = _thoughts
        .map((thought) => jsonEncode(thought.toJson()))
        .toList();

    await prefs.setStringList(_storageKey, data);
  }

  // Add a thought
  Future<void> addThought(Thought thought) async {
    _thoughts.add(thought);
    await _saveToStorage();
  }

  // Get all thoughts
  List<Thought> getThoughts() {
    return List.unmodifiable(_thoughts);
  }

  // Delete a thought
  Future<void> deleteThought(String id) async {
    _thoughts.removeWhere((thought) => thought.id == id);
    await _saveToStorage();
  }

  // Update a thought
  Future<void> updateThought(Thought updatedThought) async {
    final index = _thoughts.indexWhere(
      (thought) => thought.id == updatedThought.id,
    );

    if (index != -1) {
      _thoughts[index] = updatedThought;
      await _saveToStorage();
    }
  }
}
