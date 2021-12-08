// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';

// ignore: duplicate_ignore
class TextInputWidget extends StatefulWidget {
  // final Function(String) callback;
  // const TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  // final controller = TextEditingController();

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  // void click() {
  //   //widget.callback(controller.text);
  //   FocusScope.of(context).unfocus();
  //   controller.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(
          color: CustomColors.firebaseYellow,
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
              onPressed: () {},
            )));
  }
}
