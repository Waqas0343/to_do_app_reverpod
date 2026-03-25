import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../providers/login_rev_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: controller.emailController,
              hintText: "Email",
            ),
            SizedBox(height: 12),
            CustomTextFormField(
              controller: controller.passwordController,
              hintText: "Password",
            ),
            SizedBox(height: 20),
            CustomButton(
              title: "Login",
              onPressed: () {
                ref
                    .read(loginControllerProvider.notifier)
                    .login(
                      context,
                      controller.emailController.text.trim(),
                      controller.passwordController.text.trim(),
                    );
              },
            ),
            TextButton(
              onPressed: () => controller.goToSignUp(context),
              child: Text(
                "Don't have an account? Sign Up",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
