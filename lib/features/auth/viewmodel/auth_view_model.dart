// import 'package:flutter/material.dart';
// import 'package:quote_vault/features/auth/repository/auth_repository.dart';

// class AuthViewModel extends ChangeNotifier {
//   final AuthRepository _repo = AuthRepository();

//   bool isLoading = false;
//   String? errorMessage;

//   Future<bool> login(String email, String password) async {
//     return _execute(() => _repo.login(email, password));
//   }

//   Future<bool> signup(String name, String email, String password) async {
//     return _execute(() => _repo.signup(name, email, password));
//   }

//   Future<bool> resetPassword(String email) async {
//     return _execute(() => _repo.resetPassword(email));
//   }

//   Future<bool> _execute(Future<void> Function() action) async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       await action();
//       return true;
//     } catch (e) {
//       errorMessage = e.toString();
//       return false;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:quote_vault/features/auth/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _repo = AuthRepository();

  bool isLoading = false;
  String? errorMessage;

  /// Generic _execute helper
  Future<T?> _execute<T>(Future<T> Function() action) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await action();
      return result;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Signup
  Future<bool> signup(String name, String email, String password) async {
    final AuthResponse? res =
        await _execute(() => _repo.signup(name, email, password));

    if (res == null || res.user == null) {
      errorMessage ??= 'Signup failed';
      return false;
    }
    return true;
  }

  /// Login
  Future<bool> login(String email, String password) async {
    final AuthResponse? res =
        await _execute(() => _repo.login(email, password));

    if (res == null || res.session == null) {
      errorMessage ??= 'Invalid credentials';
      return false;
    }
    return true;
  }

  /// Reset password
 Future<bool> resetPassword(String email) async {
  try {
    // _execute will handle isLoading and errorMessage
    await _execute(() => _repo.resetPassword(email));
    return true; // Success
  } catch (_) {
    errorMessage ??= 'Failed to send reset email';
    return false; // Failed
  }
}

  /// Logout
  Future<void> logout() async {
    await _execute(() => _repo.logout());
  }

  /// Check if user is logged in
  bool get isLoggedIn => _repo.isUserLoggedIn();

  /// Get current user info
  Map<String, dynamic>? get currentUser => _repo.currentUser();
}
