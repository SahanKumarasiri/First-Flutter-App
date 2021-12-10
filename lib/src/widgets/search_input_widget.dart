// ignore_for_file: use_key_in_widget_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/screens/search_screen.dart';
import 'package:myfirstapp/src/utils/validator.dart';

// ignore: duplicate_ignore
class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({required User user}) : _user = user;

  final User _user;

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Form(
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
                prefixIcon: const Icon(Icons.search),
                labelText: "Search by author's name ",
                hintText: "Note: case sensitive",
                hintStyle: const TextStyle(color: Colors.red),
                labelStyle: TextStyle(
                  color: CustomColors.firebaseGrey,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  splashColor: Colors.blue,
                  tooltip: "Post comment",
                  onPressed: () async {
                    if (_addItemFormKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          input: _commentController.text,
                          user: _user,
                        ),
                      ));
                    }
                  },
                ))),
      ),
    );
  }
}
