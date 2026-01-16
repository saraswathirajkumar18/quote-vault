import 'package:flutter/material.dart';
import 'package:quote_vault/core/widgets/main_nav.dart';
import 'package:quote_vault/features/auth/view/login_view.dart';
import 'package:quote_vault/features/home/view/screens/home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = snapshot.data?.session ??
            Supabase.instance.client.auth.currentSession;

        if (session != null) {
          return MainNav();
        } else {
          return LoginView();
        }
      },
    );
  }
}
