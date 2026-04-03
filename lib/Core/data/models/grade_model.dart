import 'package:coursaty/Core/data/models/course_model.dart';

class GradeModel {
  final String id;
  final CourseModel courseModel;
  final int grade;
  final String letterGrade;
  final DateTime createdAt;

  GradeModel({
    required this.id,
    required this.courseModel,
    required this.grade,
    required this.letterGrade,
    required this.createdAt,
  });

  factory GradeModel.fromJson(Map<String, dynamic> json) {
    return GradeModel(
      id: json['_id'],
      courseModel: CourseModel.fromJson(json['course']),
      grade: json['grade'],
      letterGrade: json['letterGrade'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
