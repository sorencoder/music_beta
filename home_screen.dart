import 'package:flutter/material.dart';
final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: TitleSection(),
            ),
            ListView(children: <Widget>[
              Container(
                color: Colors.white,
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  @override
  _TitleSectionState createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        height: 100,
        width: 100,
        color: Colors.teal,
      )
    ]);
  }
}
