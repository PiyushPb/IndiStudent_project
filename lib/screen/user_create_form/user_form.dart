import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateUserFormPage extends StatefulWidget {
  const CreateUserFormPage({super.key});

  @override
  State<CreateUserFormPage> createState() => _CreateUserFormPageState();
}

class _CreateUserFormPageState extends State<CreateUserFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Create your profile',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // ignore: prefer_const_constructors
                        labelText: 'Full name *',
                        hintText: 'Full name',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // ignore: prefer_const_constructors
                        labelText: 'Phone number',
                        hintText: '9326582108 (Optional)',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // ignore: prefer_const_constructors
                        labelText: 'College name *',
                        hintText: 'MGM\'s College of Engineering',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 112, 140, 233),
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 29, 72, 214)),
                    ),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'NOTE: if you cant find your college name in the list, please contact us.',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Contact us',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: TextFormField(
                      minLines: 5,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // ignore: prefer_const_constructors
                        labelText: 'Write about yourself',
                        hintText: 'Write something about yourself',
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
            ),
          ],
        ),
      ),
    );
  }
}
