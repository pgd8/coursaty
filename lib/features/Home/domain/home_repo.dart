import 'dart:convert';

import 'package:coursaty/Core/API/constant_api.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeRepo {

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
}