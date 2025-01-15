import 'package:dio/dio.dart';
import '../models/user.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository()
      : _dio = Dio(BaseOptions(
          baseUrl: 'YOUR_API_BASE_URL',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ));

  Future<User> signInWithEmail(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }

  Future<User> signUp(
      String name, String email, String password, String phoneNumber) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        'name': name,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
      });
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to sign up');
    }
  }

  Future<User> signInWithSocial(String provider, String token) async {
    try {
      final response = await _dio.post('/auth/social', data: {
        'provider': provider,
        'token': token,
      });
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to sign in with $provider');
    }
  }

  Future<void> signOut() async {
    try {
      await _dio.post('/auth/logout');
    } catch (e) {
      throw Exception('Failed to sign out');
    }
  }

  Future<User> getProfile() async {
    try {
      final response = await _dio.get('/auth/profile');
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get profile');
    }
  }

  Future<User> updateProfile(User user) async {
    try {
      final response = await _dio.put('/auth/profile', data: user.toJson());
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update profile');
    }
  }
}
