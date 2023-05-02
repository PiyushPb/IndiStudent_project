import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginWithEmailPage extends StatefulWidget {
  const LoginWithEmailPage({super.key});

  @override
  State<LoginWithEmailPage> createState() => _LoginWithEmailPageState();
}

class _LoginWithEmailPageState extends State<LoginWithEmailPage> {
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return desktop_screen();
            } else {
              return mobile_screen();
            }
          },
        ),
      ),
    );
  }

  Widget desktop_screen() {
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
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Expanded(child: Container()),
                      const Text(
                        'Login with Email',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 100),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: TextFormField(
                                    validator: validateEmail,
                                    // ignore: prefer_const_constructors
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // ignore: prefer_const_constructors
                                      labelText: 'Email',
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'We will send you a link to this email. You can just tap on the link to login.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 56, 56, 56),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Go back to google login'),
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // primary: Color.fromARGB(255, 7, 38, 53),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Continue'),
                        ),
                      ),
                      Expanded(child: Container()),
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

  Widget mobile_screen() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Login with Email',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        validator: validateEmail,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // ignore: prefer_const_constructors
                          labelText: 'Email',
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We will send you a link to this email. You can just tap on the link to login.',
                style: TextStyle(
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back to google login'),
              ),
            ],
          ),
          Expanded(child: Container()),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // primary: Color.fromARGB(255, 7, 38, 53),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
