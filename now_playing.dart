import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer audioplayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    initAudio();
  }
  double _currentSliderValue = 20;
  bool _isPlaying = true;
  bool _isFavourite = false;
  bool _isShuffle = false;
  String artistName = 'Artist Name';
  String songName = 'Song Name';
   initAudio(){
    audioplayer.play('https://firebasestorage.googleapis.com/v0/b/music-player-7fa3e.appspot.com/o/PALE%20KOTNE%20AATU%20SANGAT%20KULI%20MUHNI%20KIDINA%20.mp3?alt=media&token=388261b8-64ea-4c75-ada6-c9ec5065f3ed');
  }
  pauseAudio(){
    audioplayer.pause();
  }
  resumeAudio(){
    audioplayer.resume();
  }
  
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
            SizedBox(height: 25),
            Slider(
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              inactiveColor: Colors.teal,
              value: _currentSliderValue,
              max: 15,
              min: 0,
              label: _currentSliderValue.round().toString(),
//               activeColor: Colors.black,
            ),
            Padding(
            padding: EdgeInsets.fromLTRB(20,0,15,0),
                child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width:30,
//                 color:Colors.red,
              child:Text("1:25"),
              ),
              Container(
                width:30,
//                 color:Colors.green,
              child:Text("7:30"),
              ),
            ],
            ),
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
                FlatButton(
                    child: Icon(
                        _isPlaying
                            ? Icons.pause_circle_filled_rounded
                            : Icons.play_circle_outline,
                        size: 50,
                        color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _isPlaying? resumeAudio():pauseAudio();
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
