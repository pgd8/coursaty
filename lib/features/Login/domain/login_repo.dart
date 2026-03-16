import 'dart:convert';
import 'package:coursaty/Core/API/constant_api.dart';
import 'package:coursaty/Core/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {

  void storeToken({required String token}) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.kToken, token);
  }

  Future<void> login({required Map<String, dynamic> data}) async {
    try {
      final Uri url = Uri.parse('${ConstantApi.baseUrl}/api/auth/login');
      final response = await http.post(
          url,
          headers: {
            'Content-Type' : 'application/json',
            'Accept' : 'application/json'
          },
          body: jsonEncode(data)
      );
      final decoded = jsonDecode(response.body);
      debugPrint(response.body);
      debugPrint(data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = decoded['accessToken'];
        storeToken(token: token);
        return decoded;
      } else {
        throw Exception(decoded['message'] ?? 'Login failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
