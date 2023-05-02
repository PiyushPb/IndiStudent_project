import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/common/sign_in_with_google_btn.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:indistudent/screen/login_pages/login_with_email.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 80.w,
                        child: Image.asset('assets/images/communityimg.png'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Join India's most active student community with 1.5 million+ students",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Make smart friends, learn new skills, and grow your network like you have never done before. It\'s a place to have fun and explore more students with similar interests.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 83, 83, 83),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginWithEmailPage(),
                            ),
                          );
                        },
                        child: const Text('Sign in using Email'),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // ignore: prefer_const_constructors
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'OR',
                        style: TextStyle(
                          color: Color.fromARGB(255, 83, 83, 83),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const SignInWithGoogleButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
