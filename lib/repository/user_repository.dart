import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class UserRepository {
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hashed = sha256.convert(bytes);
    return hashed.toString();
  }

  Future<http.Response> login(String email, String password) {
    final hashedPassword = _hashPassword(password);

    return http.post(
      Uri.parse('https://apiv2stg.promilo.com/user/oauth/token'),
      headers: {
        'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
      },
      body: {
        'username': email,
        'password': hashedPassword,
        'grant_type': 'password',
      },
    );
  }
}
