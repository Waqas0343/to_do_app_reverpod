import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app_reverpod/routes/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../providers/sign_up_rev_provider.dart';

class SignupScreen extends ConsumerWidget {
 const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: controller.nameController, hint: "Name"),
            SizedBox(height: 12),
            CustomTextField(controller: controller.emailController, hint: "Email"),
            SizedBox(height: 12),
            CustomTextField(controller: controller.passwordController, hint: "Password"),
            SizedBox(height: 20),
            CustomButton(
              title: "Sign Up",
              onPressed: () => Navigator.pushNamed(context, AppRoutes.homeScreen),
            ),
          ],
        ),
      ),
    );
  }
}