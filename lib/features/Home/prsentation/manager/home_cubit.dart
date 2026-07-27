import 'package:acoursa/features/Home/domain/home_repo.dart';
import 'package:acoursa/features/Home/prsentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  void getCourses() async {
    emit(HomeLoadingCourses());
    try {
      final courses = await homeRepo.getCourses();
      emit(HomeCoursesLoaded(courses));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void getCourseById({required String couseId}) async {
    emit(GetCouseLoading());
    try {
      final course = await homeRepo.getCourseById(couseId: couseId);
      emit(GotCourseSuccess(course));
    } catch (e) {
      emit(GetCourseError(e.toString()));
    }
  }

  Future<void> enrollCourse({required String courseID}) async {
    emit(EnrollCourseLoading());
    try {
      final course = await homeRepo.enrollCourse(courseID: courseID);
      emit(EnrollCourseSuccess(course));
    } catch (e) {
      emit(EnrollCourseError(message: e.toString()));
    }
  }

  void getMyCourses() async {
    emit(GetMyCoursesLoading());
    try {
      final courses = await homeRepo.getMyCourses();
      emit(GetMyCoursesSuccess(courses));
    } catch (e) {
      emit(GetMyCoursesError(message: e.toString()));
    }
  }

  void getMyCourseById({required String courseId}) async {
    emit(GetMyCourseByIdLoading());
    try {
      final course = await homeRepo.getMyCourseById(courseId: courseId);
      emit(GetMyCourseByIdSuccess(course));
    } catch (e) {
      emit(GetMyCourseByIdError(message: e.toString()));
    }
  }
}
