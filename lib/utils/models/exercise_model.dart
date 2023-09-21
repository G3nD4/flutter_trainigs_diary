class Exercise {
  final String title;
  final String? description;

  Exercise({required this.title, this.description});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'type': 'exercise',
    };
  }
}
