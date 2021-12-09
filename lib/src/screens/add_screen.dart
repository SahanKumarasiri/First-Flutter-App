import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/widgets/add_item_form.dart';
import 'package:myfirstapp/src/widgets/app_bar_title.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  late User _user;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: AppBarTitle(),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: AddItemForm(
                titleFocusNode: _titleFocusNode,
                descriptionFocusNode: _descriptionFocusNode,
                user: _user,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
