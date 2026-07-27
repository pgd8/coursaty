import 'dart:convert';
import 'package:acoursa/Core/API/constant_api.dart';
import 'package:acoursa/Core/data/models/grade_model.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<void> markAsCheating({
    required String token,
    required String courseId,
    required String studentId,
  }) async {
    try {
      final Uri url = Uri.parse(
        '${ConstantApi.baseUrl}/api/enrollments/course/$courseId/student/$studentId/cheating',
      );
      final response = await http.patch(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to mark as cheating');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GradeModel>> getGrades({required String token}) async {
    try {
      final Uri url = Uri.parse(
        '${ConstantApi.baseUrl}/api/enrollments/me/grades',
      );
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data.map<GradeModel>((e) => GradeModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to get grades');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setGrade({
    required String token,
    required String enrollmentId,
    required int grade,
  }) async {
    try {
      final Uri url = Uri.parse(
        '${ConstantApi.baseUrl}/api/enrollments/$enrollmentId/set-grade',
      );
      final response = await http.patch(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'grade': grade}),
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to set grade');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
