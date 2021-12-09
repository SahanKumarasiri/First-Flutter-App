import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/screens/add_screen.dart';
import 'package:myfirstapp/src/screens/sign_in_screen.dart';
import 'package:myfirstapp/src/utils/auth.dart';
import 'package:myfirstapp/src/widgets/app_bar_title.dart';
import 'package:myfirstapp/src/widgets/item_list.dart';
import 'package:myfirstapp/src/widgets/search_input_widget.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  final String time = DateTime.now().toString().substring(0, 4);

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomColors.firebaseNavy,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(),
            _user.photoURL != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ClipOval(
                      child: Material(
                        color: CustomColors.firebaseNavy,
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: CustomColors.firebaseGrey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: CustomColors.firebaseGrey,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 16.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 50),
                child: Text(
                  _user.displayName!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SearchInputWidget(),
            const SizedBox(height: 8.0),
            Card(
              color: CustomColors.firebaseOrange,
              child: ListTile(
                leading: const Icon(
                  Icons.account_box_outlined,
                  color: Colors.white,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                title: const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
                subtitle: Text(
                  "See your posts | Manage your preferences",
                  style: TextStyle(color: CustomColors.firebaseGrey),
                ),
              ),
            ),
            Card(
              color: Colors.lightGreen,
              child: ListTile(
                leading: const Icon(
                  Icons.credit_score_outlined,
                  color: Colors.white,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                title: const Text(
                  'Credits',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
                subtitle: Text(
                  "About US | Technologies",
                  style: TextStyle(color: CustomColors.firebaseGrey),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "v2.0",
                  style: TextStyle(color: CustomColors.firebaseGrey),
                ),
              ),
            ),
            _isSigningOut
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 180),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.redAccent,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 8.0),
                        child: Text(
                          '🏃‍♂️ Sign Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

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
        backgroundColor: CustomColors.firebaseNavy,
        title: AppBarTitle(),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () => {_buildDrawer(context)},
        // ),
      ),
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
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemList(
            user: _user,
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
