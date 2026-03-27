import 'package:coursaty/Core/data/models/course_model.dart';

class EnrolledCourseModel {
  final CourseModel courseModel;
  final String id;
  final String studentId;
  double? grade;
  String status;

  EnrolledCourseModel({
    required this.courseModel,
    required this.id,
    required this.studentId,
    this.grade,
    required this.status,
  });

  factory EnrolledCourseModel.fromJson(Map<String, dynamic> json) {
    return EnrolledCourseModel(
      courseModel: CourseModel.fromJson(json['course']),
      id: json['_id'],
      studentId: json['student'],
      grade: json['grade'],
      status: json['status'],
    );
  }
}
