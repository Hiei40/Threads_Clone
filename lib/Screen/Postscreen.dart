import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({Key? key}) : super(key: key);

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add post"),
        actions: [
          TextButton(
            onPressed: () {
              if (postController.text.isNotEmpty) {
                final postCollection =
                FirebaseFirestore.instance.collection('posts');
                final docId = postCollection.doc().id;

                postCollection.doc(docId).set({
                  'content': postController.text,
                  'user': FirebaseAuth.instance.currentUser?.displayName,

                },
                  SetOptions(merge: true),
                );
               postCollection.doc(docId).set({
                 'profile_picture':
                 FirebaseAuth.instance.currentUser?.photoURL,
                 "createdAt": DateTime.now(),
                 "post_id":docId,
               },
                   SetOptions(merge: true),
              );

              }
            },
            child: Text("post",
            style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: TextFormField(
        controller: postController,
        decoration: InputDecoration(
          hintText: 'write your post',
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        maxLines: 50,
      ),
    );
  }
}
