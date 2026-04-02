import 'package:coursaty/Core/API/constant_api.dart';
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
}
