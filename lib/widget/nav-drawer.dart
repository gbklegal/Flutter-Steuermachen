import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steuermachen/providers/authentication-provider.dart';
import 'package:steuermachen/screens/authentication-screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<AuthenticationProvider>(
      builder: (contect, auth, child) {
        if (auth.authenticated) {
          return ListView(
            children: [
              ListTile(title: Text("Maximilian Schieder")),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Provider.of<AuthenticationProvider>(context, listen: false)
                      .logout();
                },
              )
            ],
          );
        } else {
          return ListView(
            children: [
              ListTile(
                title: Text("Login"),
                onTap: () {
                  Navigator.push(
                      contect,
                      MaterialPageRoute(
                          builder: (context) => AuthenticationScreen()));
                },
              )
            ],
          );
        }
      },
    ));
  }
}
