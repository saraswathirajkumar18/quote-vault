import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/core/constants/app_strings.dart';
import 'package:quote_vault/features/auth/viewmodel/auth_view_model.dart';
import 'package:quote_vault/features/auth/widgets/app_text_field.dart';
import 'package:quote_vault/features/auth/widgets/primary_button.dart';

/*class ResetPasswordView extends StatefulWidget {
  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
    late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewModel>(
        builder: (_, model, __) => Column(
          children: [
            AppTextField(label: AppStrings.email),
            PrimaryButton(
              text: AppStrings.forgotPassword,
              onTap: () async {
                await model.resetPassword('email');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppStrings.resetEmailSent)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewModel>(
        builder: (context, vm, _) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.forgotPassword),

                const SizedBox(height: 16),

                AppTextField(
                  label: AppStrings.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 24),

                PrimaryButton(
                  text: AppStrings.forgotPassword,
                  loading: vm.isLoading,
                  onTap: () async {
                    final success = await vm.resetPassword(
                      emailController.text.trim(),
                    );

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.resetEmailSent),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            vm.errorMessage ?? AppStrings.unknownError,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
