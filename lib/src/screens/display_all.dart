import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/widgets/app_bar_title.dart';
import 'package:myfirstapp/src/widgets/text_input_widget.dart';

class DisplayAllScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String user;
  final String documentId;
  final String time;

  const DisplayAllScreen({
    Key? key,
    required this.currentTitle,
    required this.currentDescription,
    required this.user,
    required this.documentId,
    required this.time,
  }) : super(key: key);

  @override
  _DisplayAllScreenState createState() => _DisplayAllScreenState();
}

class _DisplayAllScreenState extends State<DisplayAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: AppBarTitle(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Title 👉 " + widget.currentTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Posted by " + widget.user,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.currentDescription,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  ),
                ),
              ),
              TextInputWidget()
            ],
          )
        ],
      ),
    );
  }
}
