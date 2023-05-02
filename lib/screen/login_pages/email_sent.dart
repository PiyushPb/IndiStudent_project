import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmailSentPage extends StatefulWidget {
  const EmailSentPage({super.key});

  @override
  State<EmailSentPage> createState() => _EmailSentPageState();
}

class _EmailSentPageState extends State<EmailSentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/gmailgif.gif'),
              ),
              // ignore: prefer_const_constructors
              Text(
                'Email Sent',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 20),
              const Text(
                  'We have sent a link to your email address. Click on the link to activae your account. Please note the link sent to your account will expire in 15 minutes. Check your Spam folder if you do not see the email in your inbox.'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Did not receive the email\nor entered wrong email?'),
                  Expanded(child: Container()),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Try Again'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Having trouble with the link? \ncontact us for help.'),
                  Expanded(child: Container()),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Contact us'),
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
        ),
      ),
    );
  }
}
