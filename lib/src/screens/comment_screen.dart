import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/widgets/list_comments.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key, required this.comment}) : super(key: key);

  final String comment;

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final String time = DateTime.now().toString().substring(0, 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            Text(
              'Comments for : ',
              style: TextStyle(
                color: CustomColors.firebaseYellow,
                fontSize: 18,
              ),
            ),
            Text(
              widget.comment,
              style: TextStyle(
                color: CustomColors.firebaseOrange,
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () => {_buildDrawer(context)},
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemListComment(
            title: widget.comment,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 90, bottom: 5),
        child: Text(
          "Copyright " + time + " ©️" + " අමායා™️ Inc.",
          style: TextStyle(color: CustomColors.firebaseOrange),
        ),
      ),
    );
  }
}
