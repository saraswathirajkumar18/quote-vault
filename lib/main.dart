import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/core/constants/app_colors.dart';
import 'package:quote_vault/core/constants/app_routes.dart';
import 'package:quote_vault/core/theme/app_theme.dart';
import 'package:quote_vault/features/auth/view/login_view.dart';
import 'package:quote_vault/features/auth/view/signup_view.dart';
import 'package:quote_vault/features/auth/viewmodel/auth_view_model.dart';
import 'package:quote_vault/features/auth/widgets/auth_gate.dart';
import 'package:quote_vault/features/home/view/screens/home_view.dart';
import 'package:quote_vault/features/home/viewmodel/navigation_view_model%20.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ChangeNotifierProvider(create: (_) => NavigationViewModel()),
  ],
  child: MyApp(),)
);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Vault',
      debugShowCheckedModeBanner: false,
  theme: AppTheme.lightTheme,
      //initialRoute: Routes.login,
      routes: {
        Routes.login: (_) => LoginView(),
        Routes.signUp: (_) => SignupView(),
        Routes.home: (_) => HomeView(),
        
      },
      home: const AuthGate(), // ✅ IMPORTANT CHANGE
    );
  }
}
