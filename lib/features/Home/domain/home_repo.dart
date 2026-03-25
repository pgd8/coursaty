import 'dart:convert';

import 'package:coursaty/Core/API/constant_api.dart';
import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {

   Future<String> getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token =  prefs.getString(Constants.kToken);
    return token ?? '';
  }

  Future<List<CourseModel>> getCourses()async{
    try{
      final Uri url = Uri.parse('${ConstantApi.baseUrl}/api/courses');
      final response = await http.get(url);

      final data = jsonDecode(response.body);
      if(response.statusCode == 200||response.statusCode == 201){
       debugPrint('Courses loaded successfully: $data');
        return data.map<CourseModel>((course) => CourseModel.fromJson(course)).toList();
      }else{
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }




  Future<CourseModel> getCourseById({required String couseId}) async{
    try{
      final Uri url = Uri.parse('${ConstantApi.baseUrl}/api/courses/$couseId');
      final response = await http.get(url);
      
      final data = jsonDecode(response.body);
      if(response.statusCode == 200||response.statusCode == 201){
       debugPrint('Course loaded successfully: $data');
        return CourseModel.fromJson(data);
      }else{
        throw Exception('Failed to load course');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CourseModel> enrollCourse({required String courseID}) async{
    try{
      final Uri url = Uri.parse('${ConstantApi.baseUrl}/api/enrollments');
      String token = await getToken();
      final response = await http.post(url,
      headers: {
        'Authorization' :  'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'courseId': courseID
      }));

      final data = jsonDecode(response.body);
      if(response.statusCode == 200||response.statusCode == 201){
       debugPrint('Course enrolled successfully: $data');
        return CourseModel.fromJson(data);
      }else{
        throw Exception('Failed to enroll course');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}