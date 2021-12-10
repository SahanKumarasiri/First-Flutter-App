import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/widgets/app_bar_title.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  final String time = DateTime.now().toString().substring(0, 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        title: AppBarTitle(),
        elevation: 0,
        centerTitle: true,
        backgroundColor: CustomColors.firebaseNavy,
      ),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              "assets/developer.jpeg",
              width: 200,
              height: 200,
            ),
          ),
          Center(
            child: Text(
              "Developer Details",
              style: TextStyle(color: CustomColors.firebaseGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: const [
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text("Phone"),
                  subtitle: Text("0776135690"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Email"),
                  subtitle: Text("kumarasirisahan@gmail.com"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.facebook),
                  title: Text("Facebook"),
                  subtitle: Text("https://www.facebook.com/Sahan.R.Inc"),
                ),
              ),
            ]),
          ),
          Center(
            child: Text(
              "Technologies",
              style: TextStyle(color: CustomColors.firebaseGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Row(
              children: [
                Center(
                  child: Image.asset(
                    "assets/Flutter.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/Firebase.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "Copyright",
                style: TextStyle(color: CustomColors.firebaseGrey),
              ),
            ),
          ),
          Center(
            child: Text(
              "Copyright " + time + " ©️" + " අමායා™️ Inc.",
              style: TextStyle(color: CustomColors.firebaseOrange),
            ),
          ),
        ],
      ),
    );
  }
}
