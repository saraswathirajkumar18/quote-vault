import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/core/constants/app_routes.dart';
import 'package:quote_vault/core/constants/app_strings.dart';
import 'package:quote_vault/features/auth/viewmodel/auth_view_model.dart';
import 'package:quote_vault/features/auth/widgets/app_text_field.dart';
import 'package:quote_vault/features/auth/widgets/auth_footer.dart';
import 'package:quote_vault/features/auth/widgets/primary_button.dart';


class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final fullNameController=TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Consumer<AuthViewModel>(
            builder: (_, model, __) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const SizedBox(height: 30),

                // App name
                Text(
                  AppStrings.appName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),

                const SizedBox(height:20),

                // Title
                Text(
                  AppStrings.joinQuoteVault,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(height: 10),

                // Subtitle
                Text(
                  AppStrings.signupSubtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                const SizedBox(height: 32),
                //fullName
                AppTextField(
                  label: AppStrings.fullName,
                  controller: fullNameController,
                ),

                // Email
                AppTextField(
                  label: AppStrings.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                // Password
                AppTextField(
                  label: AppStrings.password,
                  controller: passwordController,
                  obscure: _obscurePassword,
                  suffix: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Sign up button
                PrimaryButton(
                  text: AppStrings.createAccount ,
                  loading: model.isLoading,
                  onTap: () async {
                    if (fullNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

                    final success = await model.signup(
                      fullNameController.text.trim(),
      emailController.text.trim(),
      passwordController.text,
                    );
                    if (success) {
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(model.errorMessage ?? AppStrings.unknownError),
        ),
      );
    }
                    // if (!success) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text(
                    //         model.errorMessage ??
                    //             AppStrings.unknownError,
                    //       ),
                    //     ),
                    //   );
                    // }
                  },
                ),

                const Spacer(),

                // Footer: already have account
                AuthFooter(
                  text: AppStrings.alreadyHaveAccount,
                  actionText: AppStrings.signIn,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
