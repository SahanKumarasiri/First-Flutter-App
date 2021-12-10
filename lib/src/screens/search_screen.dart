import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/widgets/search_item_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.input, required User user})
      : _user = user,
        super(key: key);

  final String input;
  final User _user;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: CustomColors.firebaseNavy,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 8),
              Text(
                "Your ",
                style: TextStyle(
                  color: CustomColors.firebaseYellow,
                  fontSize: 18,
                ),
              ),
              Text(
                "Search Result",
                style: TextStyle(
                  color: CustomColors.firebaseOrange,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: SearchItem(
              input: widget.input,
              user: _user,
            ),
          ),
        ));
  }
}
