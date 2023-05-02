import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:indistudent/core/features/home/screen/profile_screen.dart';
import 'package:indistudent/core/features/home/screen/updates_screen.dart';
import 'package:indistudent/core/features/home/screen/widgets/circle_button.dart';
import 'package:indistudent/core/features/home/screen/widgets/communities.dart';
import 'package:indistudent/core/features/post/newpost.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class PostCard extends StatefulWidget {
  final Map<String, dynamic> postData;

  PostCard(this.postData);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  void _handleLikeButtonPress() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.postData['creatorPhotoUrl']),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postData['creatorName'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMMd()
                          .add_jm()
                          .format(widget.postData['createdAt'].toDate()),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.network(widget.postData['imageUrl']),
            SizedBox(height: 10),
            Text(widget.postData['caption']),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                  ),
                  onPressed: _handleLikeButtonPress,
                ),
                Text(
                  '${widget.postData['likes']} likes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final postCollection = FirebaseFirestore.instance.collection('posts');

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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: true,
            backgroundColor: Colors.white,
            title: SizedBox(
              width: 100,
              child: Image.asset('assets/images/logo.png'),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleNavButton(
                icon: Icons.search,
                iconSize: 25.0,
                onPressed: () => print('Search'),
              ),
              CircleNavButton(
                icon: LineIcons.facebookMessenger,
                iconSize: 25.0,
                onPressed: () => print('Search'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot>(
              stream: postCollection
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final postDocs = snapshot.data!.docs;

                  return Column(
                    children: postDocs.map((doc) {
                      final postData = doc.data() as Map<String, dynamic>;
                      return PostCard(postData);
                    }).toList(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePostScreen()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
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
            selectedIndex: 0, // set initial selected tab index here
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
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatesScreen(),
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
    );
  }
}
