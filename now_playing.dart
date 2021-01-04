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
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Now Playing',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height:5),
            Container(
                height:150,
                  width:150,
//               padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
