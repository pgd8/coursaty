class CourseModel {
  String id;
  String? image;
  String title;
  int cost;
  int duration;
  String description;
  bool isActive;
  int capacity;

  CourseModel({
    required this.id,
    required this.title,
    this.image,
    required this.duration,
    required this.description,
    required this.cost,
    required this.isActive,
    required this.capacity,
  });

  CourseModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['_id'],
        title: json['title'],
        image: json['imageUrl'],
        duration: json['duration'],
        description: json['description'],
        cost: json['cost'],
        isActive: json['active'],
        capacity: json['capacity'],
      );
}
