import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steuermachen/providers/authentication-provider.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthenticationState();
  }
}

class AuthenticationState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void submit() {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .login(credentials: {
      'email': _email,
      'password': _password,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email", hintText: "you@example.com"),
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("Login"),
                      onPressed: () {
                        _formKey.currentState.save();
                        this.submit();
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
