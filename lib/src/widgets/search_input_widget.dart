// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/screens/comment_screen.dart';
import 'package:myfirstapp/src/utils/database.dart';

// ignore: duplicate_ignore
class SearchInputWidget extends StatefulWidget {
  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final _addItemFormKey = GlobalKey<FormState>();

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: TextField(
          controller: _commentController,
          style: TextStyle(
            color: CustomColors.firebaseYellow,
          ),
          // controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: "Type here to search ",
              labelStyle: TextStyle(
                color: CustomColors.firebaseGrey,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                splashColor: Colors.blue,
                tooltip: "Post comment",
                onPressed: () async {
                  // await Database.addComment(
                  //     user: _user.displayName.toString(),
                  //     comment: _commentController.text,
                  //     title: widget.title);
                  // _commentController.clear();
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         CommentScreen(comment: widget.title),
                  //   ),
                  // );
                },
              ))),
    );
  }
}
