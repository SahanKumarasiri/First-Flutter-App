import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/widgets/private_item_list.dart';

class PrivateFeelings extends StatefulWidget {
  const PrivateFeelings({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _PrivateFeelingsState createState() => _PrivateFeelingsState();
}

class _PrivateFeelingsState extends State<PrivateFeelings> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 20.0,
        ),
        child: PrivateItemList(
          user: _user,
        ),
      ),
    );
  }
}
