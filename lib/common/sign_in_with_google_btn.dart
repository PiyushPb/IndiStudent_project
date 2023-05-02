import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';

class SignInWithGoogleButton extends ConsumerWidget {
  const SignInWithGoogleButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: OutlinedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        // ignore: prefer_const_constructors
        icon: Image.asset(
          'assets/images/google.png',
          height: 24,
        ),
        label: Text('Sign in using Google'), // <-- Text
      ),
    );
  }
}
