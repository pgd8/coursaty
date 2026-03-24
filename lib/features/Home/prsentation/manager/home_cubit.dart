import 'package:coursaty/features/Home/domain/home_repo.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_state.dart';
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

  void getCourseById({required String couseId}) async{
    emit(GetCouseLoading());
    try {
      final course = await homeRepo.getCourseById(couseId: couseId);
      emit(GotCourseSuccess(course));
    } catch (e) {
      emit(GetCourseError(e.toString()));
    }
  }
}