import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../base.dart';

String baseUrl = api.url;
String registerUrl = '${api.url}auth/register';
Future<Map<String, dynamic>?> getCurrentUser() async {
  try {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user == null) {
      return null;
    }
    final token = await user.getIdToken(true);
    final url = Uri.parse('${baseUrl}auth/me');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['user']; // return only the user object
    } else if (response.statusCode == 401) {
      return null;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}