import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
         theme: ThemeData(
    accentTextTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
  ),
        debugShowCheckedModeBanner: false,
        home: PlayerPage());
  }
}

class PlayerPage extends StatelessWidget {
  final rating = 20.0;
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
//         color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              height: 150,
              width: 150,
//               padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            SizedBox(height: 10),
            Text('Song Name',
                style: TextStyle(color: Colors.black, fontSize: 30)),
//             Container(
// //               height:100,
// //               width:100,
// //               color: Colors.red,
//               child: Text('Song Name',
//                   style: TextStyle(color: Colors.black, fontSize: 30)),
//             ),
            SizedBox(height: 10),
            Text(
              'Artist Name',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(height: 55),
            Slider(
              onChanged: null,
              inactiveColor: Colors.black,
              value: rating,
              max: 100,
              min: 0,
//               label: rating.toString(),
              activeColor: Colors.black,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.favorite,color:Colors.black),
                Icon(Icons.arrow_back,color:Colors.black),
                Icon(Icons.play_circle_fill_rounded,size:60,color:Colors.black),
                Icon(Icons.arrow_forward,color:Colors.black),
                Icon(Icons.shuffle,color:Colors.black)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
