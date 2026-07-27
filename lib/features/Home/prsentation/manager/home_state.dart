import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:coursaty/Core/data/models/enrolled_course_model.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingCourses extends HomeState {}

class HomeCoursesLoaded extends HomeState {
  final List<CourseModel> courses;

  HomeCoursesLoaded(this.courses);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class GetCouseLoading extends HomeState {}

class GotCourseSuccess extends HomeState {
  final CourseModel course;

  GotCourseSuccess(this.course);
}

class GetCourseError extends HomeState {
  final String message;

  GetCourseError(this.message);
}

class EnrollCourseLoading extends HomeState {}

class EnrollCourseSuccess extends HomeState {
  final CourseModel course;
  EnrollCourseSuccess(this.course);
}

class EnrollCourseError extends HomeState {
  final String message;
  EnrollCourseError({required this.message});
}

class GetMyCoursesLoading extends HomeState {}

class GetMyCoursesSuccess extends HomeState {
  final List<EnrolledCourseModel> courses;
  GetMyCoursesSuccess(this.courses);
}

class GetMyCoursesError extends HomeState {
  final String message;
  GetMyCoursesError({required this.message});
}

class GetMyCourseByIdLoading extends HomeState {}

class GetMyCourseByIdSuccess extends HomeState {
  final EnrolledCourseModel course;
  GetMyCourseByIdSuccess(this.course);
}

class GetMyCourseByIdError extends HomeState {
  final String message;
  GetMyCourseByIdError({required this.message});
}
