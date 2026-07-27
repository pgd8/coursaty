import 'dart:convert';
import 'package:acoursa/Core/API/constant_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupRepo {

  Future<Map<String, dynamic>> createAccount({
    required Map<String, dynamic> data,
  }) async {
    try {
      Uri url = Uri.parse('${ConstantApi.baseUrl}/api/auth/register');

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(data),
      );
      debugPrint(response.body);
      debugPrint(data.toString());
      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return decoded;
      } else {
        throw Exception(decoded['message'] ?? 'Signup failed');
      }

    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}