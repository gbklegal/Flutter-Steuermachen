import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steuermachen/providers/authentication-provider.dart';
import 'package:steuermachen/widget/nav-drawer.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => AuthenticationProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer<AuthenticationProvider>(
          builder: (contect, auth, child) {
            if (auth.authenticated) {
              return Text("You are signed in.");
            } else {
              return Text("You are not signed in yet.");
            }
          },
        ),
      ),
    );
  }
}
