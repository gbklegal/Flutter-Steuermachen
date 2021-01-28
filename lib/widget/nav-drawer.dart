import 'package:flutter/material.dart';
import 'package:steuermachen/screens/authentication-screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Maximilian Schieder"),
          ),
          ListTile(
            title: Text("Signin"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthenticationScreen()));
            },
          ),
        ],
      ),
    );
  }
}
