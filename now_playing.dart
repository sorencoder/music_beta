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

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double _currentSliderValue = 20;
  bool _isPlaying = true;
  bool _isFavourite = false;
  bool _isShuffle = false;
  String artistName = 'Artist Name';
  String songName = 'Song Name';
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
            Text('$songName',
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
              '$artistName',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(height: 55),
            Slider(
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              inactiveColor: Colors.teal,
              value: _currentSliderValue,
              max: 100,
              min: 0,
              label: _currentSliderValue.round().toString(),
//               activeColor: Colors.black,
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//                  InkWell(
//                  child:Icon(Icons.favorite, color: Colors.black),
//                    onTap:(){}
//                  ),
                IconButton(
                    icon: Icon(
                        _isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _isFavourite = !_isFavourite;
                      });
                    }),
                IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {}),
                OutlineButton(
                    child: Icon(
                        _isPlaying
                            ? Icons.play_circle_outline
                            : Icons.pause_circle_filled_rounded,
                        size: 50,
                        color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    }),
                IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.black),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(_isShuffle ? Icons.shuffle : Icons.loop),
                    onPressed: () {
                      setState(() {
                        _isShuffle = !_isShuffle;
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
