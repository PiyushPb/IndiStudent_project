import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updates"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/update.png',
                height: 200,
              ),
              Text(
                'Technology addicts ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                  "Join us at the MGM for an exciting tech event! This event brings together technology experts, innovators, and enthusiasts for a day of learning and networking. Explore the latest trends and cutting-edge advancements in AI, cloud computing, cybersecurity, and more. Attend informative sessions and keynotes, participate in interactive workshops and panel discussions, and engage with industry leaders. Whether you're a seasoned tech professional or simply curious about the latest developments in the field, this event is not to be missed! Register now to secure your spot at the MGM's premier tech event.")
            ],
          ),
        ),
      ),
    );
  }
}
