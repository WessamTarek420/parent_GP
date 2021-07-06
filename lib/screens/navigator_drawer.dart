import 'package:flutter/material.dart';
import 'package:parent_gp/screens/EDitchild.dart';
import 'package:parent_gp/screens/Loginscreen.dart';
import 'package:parent_gp/screens/ViewMyChilds.dart';
import 'package:parent_gp/screens/addChild.dart';
import 'package:parent_gp/screens/edit.dart';
import 'package:parent_gp/screens/userpage.dart';
import 'package:parent_gp/screens/ViewChildGrade.dart';
import 'package:parent_gp/service/auth.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Aya';
    final email = 'aya@gmail.com';
    final _auth = Auth();
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Colors.teal[300],
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'Sarah Abs',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Add child',
                    icon: Icons.add,
                    onClicked: () {
                      Navigator.pushNamed(context, AddChild.id);
                    },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Edit information',
                    icon: Icons.edit,
                    onClicked: () {
                      Navigator.pushNamed(context, EditChild.id);
                    },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'View grade',
                    icon: Icons.grade,
                    onClicked: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewMyChilds()));
                    },
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () async {
                      await _auth.signOut();
                      Navigator.of(context).popAndPushNamed(LoginScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    @required String urlImage,
    @required String name,
    @required String email,
    @required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
