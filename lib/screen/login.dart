import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/common/loader.dart';
import 'package:indistudent/common/sign_in_with_google_btn.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:indistudent/screen/login_pages/login_with_email.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 820) {
              return isLoading ? const Loader() : desktop_login_form(context);
            } else {
              return isLoading ? const Loader() : mobile_login_form(context);
            }
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget desktop_login_form(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/magicpattern-ixxjruC7Gg4-unsplash.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        child: Image.asset('assets/images/communityimg.png'),
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
                          )),
                      Expanded(child: Container()),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginWithEmailPage(),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget mobile_login_form(BuildContext context) {
    return Padding(
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
          SizedBox(
            child: Image.asset('assets/images/communityimg.png'),
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
              )),
          Expanded(child: Container()),
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
    );
  }
}
