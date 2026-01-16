
import 'package:quote_vault/core/services/supabse_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*class AuthRepository {
  Future<void> login(String email, String password) async {
    await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signup(String name, String email, String password) async {
    await SupabaseService.client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': name},
    );
  }

  Future<void> resetPassword(String email) async {
    await SupabaseService.client.auth.resetPasswordForEmail(email);
  }

  Future<void> logout() async {
    await SupabaseService.client.auth.signOut();
  }
}*/

class AuthRepository {
  /// Signup: returns AuthResponse
  Future<AuthResponse> signup(String name, String email, String password) async {
    return await SupabaseService.client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': name},
    );
  }

  /// Login: returns AuthResponse
  Future<AuthResponse> login(String email, String password) async {
    return await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Reset password: returns void
  Future<void> resetPassword(String email) async {
    await SupabaseService.client.auth.resetPasswordForEmail(email);
  }

  /// Logout: returns void
  Future<void> logout() async {
    await SupabaseService.client.auth.signOut();
  }

  /// Check if user is logged in
  bool isUserLoggedIn() => SupabaseService.client.auth.currentUser != null;

  /// Get current user info
  Map<String, dynamic>? currentUser() =>
      SupabaseService.client.auth.currentUser?.userMetadata;
}


