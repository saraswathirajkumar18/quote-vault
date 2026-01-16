import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/core/constants/app_routes.dart';
import 'package:quote_vault/core/constants/app_strings.dart';
import 'package:quote_vault/features/auth/viewmodel/auth_view_model.dart';
import 'package:quote_vault/features/auth/widgets/app_text_field.dart';
import 'package:quote_vault/features/auth/widgets/auth_footer.dart';
import 'package:quote_vault/features/auth/widgets/primary_button.dart';

class LoginView extends StatefulWidget {

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final vm = AuthViewModel();
late final TextEditingController emailController;
  late final TextEditingController passwordController;
 bool _obscurePassword = true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => vm,
      child: Scaffold(
        body: Consumer<AuthViewModel>(
          builder: (_, model, __) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                 Text(
                    AppStrings.appName,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
              
                  const SizedBox(height: 20),
              
                  Text(
                    AppStrings.welcomeBack,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
              
                  const SizedBox(height: 10),
              
                  Text(
                    AppStrings.signInSubtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                   const SizedBox(height: 32),
                  AppTextField(
                label: AppStrings.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
                 AppTextField(
                label: AppStrings.password,
                controller: passwordController,
                obscure: _obscurePassword,
                suffix: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () => _showResetPasswordDialog(context),
    child: const Text('Forgot password?'),
  ),
),

              const SizedBox(height: 24),            
                  PrimaryButton(
                    text: AppStrings.signIn,
                    loading: model.isLoading,
                    onTap: () async {
                     
                      if (
    emailController.text.trim().isEmpty ||
    passwordController.text.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Please fill all fields')),
  );
  return;
}
                      final success = await model.login(
  emailController.text.trim(),
  passwordController.text,
);
if (success) {
  Navigator.pushReplacementNamed(context, Routes.home);
} else {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(model.errorMessage ?? AppStrings.unknownError)),
  );
}

                    },
                  ),
                   const Spacer(),

            // ===== Footer =====
            AuthFooter(
              text: AppStrings.dontHaveAccount,
              actionText: AppStrings.joinTheVault,
              onTap: () {
                Navigator.pushNamed(context, Routes.signUp);
              },
            ),

            const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _showResetPasswordDialog(BuildContext context) {
  final emailCtrl = TextEditingController();
  final auth = context.read<AuthViewModel>();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Reset Password'),
      content: TextField(
        controller: emailCtrl,
        decoration: const InputDecoration(
          labelText: 'Email',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (emailCtrl.text.trim().isEmpty) return;

            final success =
                await auth.resetPassword(emailCtrl.text.trim());
 Navigator.pop(context);
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  success
                      ? 'Password reset email sent'
                      : auth.errorMessage ?? 'Something went wrong',
                ),
              ),
            );
           
            if (success) {
      Navigator.pushNamed(context, '/login'); // navigate to login page
    }


          },
          child: const Text('Send'),
        ),
      ],
    ),
  );
}

}
