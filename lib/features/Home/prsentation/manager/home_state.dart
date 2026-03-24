import 'package:coursaty/Core/data/models/course_model.dart';

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