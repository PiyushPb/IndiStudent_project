import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:indistudent/core/features/home/screen/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:indistudent/screen/welcome_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;

  final List<GButton> tabs = [
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.announcement,
      text: 'Updates',
    ),
    GButton(
      icon: Icons.group,
      text: 'Clubs',
    ),
    GButton(
      icon: Icons.account_circle,
      text: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: _firestore.collection("users").doc(user!.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          Map<String, dynamic> data = snapshot.data!.data()!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(data['profilePic']),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          data['name'],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          data['email'],
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                  indent: 16.0,
                  endIndent: 16.0,
                  color: Theme.of(context).dividerColor,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0),
                      Text(
                        "Posts",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: 8.0),
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: _firestore
                            .collection("posts")
                            .where('creatorUid', isEqualTo: user!.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>
                              postDocs = snapshot.data!.docs;
                          List<Widget> postWidgets = [];
                          for (int i = 0; i < postDocs.length; i += 3) {
                            List<Widget> rowWidgets = [];
                            for (int j = i;
                                j < i + 3 && j < postDocs.length;
                                j++) {
                              Map<String, dynamic> postData =
                                  postDocs[j].data();
                              rowWidgets.add(
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  postData['imageUrl']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        // Text(
                                        //   postData['body'],
                                        //   maxLines: 3,
                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            postWidgets.add(
                              Row(
                                children: rowWidgets,
                              ),
                            );
                          }
                          return Column(
                            children: postWidgets,
                          );
                        },
                      ),
                      SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () async {
                          await _auth.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomePage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "Logout",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Theme.of(context).primaryColor,
              tabs: tabs,
              selectedIndex: 3, // set initial selected tab index here
              onTabChange: (index) {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
