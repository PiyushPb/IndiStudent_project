import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String _caption = '';
  bool _imageSelected = false;

  void _chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageSelected = true;
      });
    }
  }

  void _submitPost() async {
    if (_formKey.currentState!.validate() && _imageSelected) {
      // Upload image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('posts')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
      final task = storageRef.putFile(_image!);
      final snapshot = await task.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Get current user
      final currentUser = FirebaseAuth.instance.currentUser;

      // Create post in Firestore
      await FirebaseFirestore.instance.collection('posts').add({
        'imageUrl': downloadUrl,
        'caption': _caption,
        'likes': 0,
        'comments': [],
        'createdAt': DateTime.now(),
        'creatorUid': currentUser!.uid,
        'creatorName': currentUser.displayName ?? '',
        'creatorPhotoUrl': currentUser.photoURL ?? '',
      });

      // Go back to previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                if (_imageSelected)
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if (!_imageSelected)
                  ElevatedButton(
                    onPressed: _chooseImage,
                    child: Text('Choose Image'),
                  ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Caption (optional)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _caption = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitPost,
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
