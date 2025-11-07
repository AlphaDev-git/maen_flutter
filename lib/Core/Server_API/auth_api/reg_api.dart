import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../base.dart';

class AuthService {
  static const String baseUrl = '${api.url}auth/register';
  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String role,
    Map<String, dynamic>? studentProfile,
    Map<String, dynamic>? teacherProfile,
    File? profileImg,
    required String authTokenOrUserId,
    bool useBearer = true,
  }) async {
    try {
      final uri = Uri.parse(baseUrl);
      final request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] =
      useBearer ? 'Bearer $authTokenOrUserId' : authTokenOrUserId;
      request.headers['Accept'] = 'application/json';
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['passwordConfirm'] = passwordConfirm;
      request.fields['role'] = role;
      if (role == 'student' && studentProfile != null) {
        request.fields['studentProfile'] = jsonEncode(studentProfile);
      } else if (role == 'teacher' && teacherProfile != null) {
        request.fields['teacherProfile'] = jsonEncode(teacherProfile);
      }
      if (profileImg != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', profileImg.path),
        );
      }
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final decoded = jsonDecode(responseBody);
      if (response.statusCode == 201) {
        print('✅ Registration success');
        return true;
      } else {
        print('❌ Registration failed: ${decoded['message']}');
        return false;
      }
    } catch (e) {
      print('🔥 Error in registerUser: $e');
      return false;
    }
  }
}
