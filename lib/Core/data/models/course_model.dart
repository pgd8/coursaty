class CourseModel {
  String id;
  String? image;
  String? title;
  int? cost;
  int? duration;
  String? description;
  bool? isActive;
  int? capacity;

  CourseModel({
    required this.id,
    this.title,
    this.image,
    this.duration,
    this.description,
    this.cost,
    this.isActive,
    this.capacity,
  });

  CourseModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['_id'],
        title: json['title'] ?? '',
        image: json['imageUrl'] ?? '',
        duration: json['duration'] ?? 0,
        description: json['description'] ?? '',
        cost: json['cost'] ?? 0,
        isActive: json['active'] ?? false,
        capacity: json['capacity'] ?? 0,
      );
}
