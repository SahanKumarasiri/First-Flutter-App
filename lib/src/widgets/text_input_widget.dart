// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/screens/comment_screen.dart';
import 'package:myfirstapp/src/utils/database.dart';
import 'package:myfirstapp/src/utils/validator.dart';

// ignore: duplicate_ignore
class TextInputWidget extends StatefulWidget {
  final _user;
  final String title;

  const TextInputWidget({required User user, required this.title})
      : _user = user;

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  final _addItemFormKey = GlobalKey<FormState>();

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: TextFormField(
          controller: _commentController,
          style: TextStyle(
            color: CustomColors.firebaseYellow,
          ),
          validator: (value) => Validator.validateField(
                value: _commentController.text,
              ),
          // controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.message),
              labelText: "Type a comment: ✍️ ",
              labelStyle: TextStyle(
                color: CustomColors.firebaseGrey,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                splashColor: Colors.blue,
                tooltip: "Post comment",
                onPressed: () async {
                  if (_addItemFormKey.currentState!.validate()) {
                    await Database.addComment(
                        user: _user.displayName.toString(),
                        comment: _commentController.text,
                        title: widget.title);
                    _commentController.clear();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CommentScreen(comment: widget.title),
                    ));
                  }
                },
              ))),
    );
  }
}
