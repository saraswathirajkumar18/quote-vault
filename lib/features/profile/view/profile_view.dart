import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/features/auth/viewmodel/auth_view_model.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();

    return 
    //Scaffold(
      //appBar: AppBar(title: const ),
      //body: 
      SafeArea(
        child: Column(
          children: [
             Text('Profile'),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: auth.isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                      width: double.infinity,
              height: 56,
                      child: ElevatedButton.icon(
                          icon: const Icon(Icons.logout),
                          label: const Text('Logout'),
                          onPressed: () async {
                            await auth.logout();
                          },
                        ),
                    ),
              ),
            ),
          ],
        //),
            ),
      );
  }
}
