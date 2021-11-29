import 'package:flutter/material.dart';
import 'dart:ui' as ui;

main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "අමායා පොත් මැදුර",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 20),
                        const Offset(150, 20),
                        <Color>[
                          Colors.red,
                          Colors.yellow,
                        ],
                      )),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ],
              flexibleSpace: Image.asset(
                "assets/logo.jpg",
                fit: BoxFit.cover,
              ),
              bottom: const TabBar(
                tabs: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Text("Novel"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Text("Adventure"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Text("Programming"),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
