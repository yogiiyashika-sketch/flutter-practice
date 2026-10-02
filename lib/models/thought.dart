class Thought {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  Thought({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Convert Thought into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Thought from JSON
  factory Thought.fromJson(Map<String, dynamic> json) {
    return Thought(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
