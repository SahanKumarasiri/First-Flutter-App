import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/screens/private_comments.dart';
import 'package:myfirstapp/src/screens/private_feelings.dart';
import 'add_screen.dart';

class PrivateScreen extends StatefulWidget {
  const PrivateScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _PrivateScreenState createState() => _PrivateScreenState();
}

class _PrivateScreenState extends State<PrivateScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                Text(
                  _user.displayName.toString().substring(0, 10) + "...'s",
                  style: TextStyle(
                    color: CustomColors.firebaseYellow,
                    fontSize: 18,
                  ),
                ),
                Text(
                  ' Profile ',
                  style: TextStyle(
                    color: CustomColors.firebaseOrange,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            backgroundColor: CustomColors.firebaseNavy,
            elevation: 0,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Feelings",
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  text: "Comments",
                  icon: Icon(Icons.comment),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: CustomColors.firebaseOrange,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddScreen(user: _user),
              ),
            );
          },
        ),
        body: TabBarView(
          children: [
            PrivateFeelings(user: _user),
            PrivateComments(user: _user),
          ],
        ),
      ),
    );
  }
}
