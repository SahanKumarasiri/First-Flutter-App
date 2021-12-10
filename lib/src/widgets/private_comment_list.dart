// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/screens/edit_comment_screen.dart';
import 'package:myfirstapp/src/screens/edit_screen.dart';
import 'package:myfirstapp/src/utils/database.dart';

class PrivateCommentList extends StatefulWidget {
  const PrivateCommentList({required User user}) : _user = user;
  final User _user;
  @override
  State<PrivateCommentList> createState() => _PrivateCommentListState();
}

class _PrivateCommentListState extends State<PrivateCommentList> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readPrivateComments(_user.displayName),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No posts yet",
                style: TextStyle(color: CustomColors.firebaseGrey),
              ),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index].data() as dynamic;
              String docID = snapshot.data!.docs[index].id;
              String title = noteInfo["title"];
              String comment = noteInfo['comment'];
              String user = noteInfo['user'];
              String time = noteInfo['time'];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditCommentScreen(
                          currentTitle: title,
                          comment: comment,
                          documentId: docID,
                          user: user,
                        ),
                      ),
                    ),
                    title: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          comment,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(""),
                        Text(
                          user + " : " + time.substring(0, 20),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }
}
