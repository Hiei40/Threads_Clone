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
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add post"),
        actions: [
          TextButton(
            onPressed: () async {
            setState(() {
              isLoading=true;
            });
            // 1. Collection Posts [x]
            // 2. extract the post content
            // 3. extract the username
            // 4. extract the profilepicutre
            // 5. createdAt
            // 6. post id


              if (postController.text.isNotEmpty) {
                final postCollection =
                    FirebaseFirestore.instance.collection('posts');
                final docId = postCollection.doc().id;

                await postCollection.doc(docId).set(
                  {
                    'content': postController.text,
                    'user': FirebaseAuth.instance.currentUser?.displayName,
                  },
                  SetOptions(merge: true),
                );
                await postCollection.doc(docId).set(
                  {
                    'profile_picture':
                        FirebaseAuth.instance.currentUser?.photoURL,
                    "createdAt": DateTime.now(),
                    "post_id": docId,
                  },
                  SetOptions(merge: true),
                );
                postController.clear();
                Navigator.of(context).pop();
              }
            },
            child: Text(
              "post",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body:isLoading==false? TextFormField(
        controller: postController,
        decoration: InputDecoration(
          hintText: 'write your post',
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        maxLines: 50,
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
