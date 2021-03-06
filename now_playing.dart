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
  AudioPlayer audioPlayer = AudioPlayer();
//   @override
//   void initState() {
//     super.initState();
//     initAudio();
//   }
  double _currentSliderValue = 20;
  bool _isPlaying = false;
  bool _isFavourite = false;
  bool _isShuffle = false;
  String artistName = 'Artist Name';
  String songName = 'Song Name';
  Duration duration;
  Duration position;
  String audioState;
  
  initAudio() {
    audioPlayer.onDurationChanged.listen((durationSong){
      // print('Total $d');
      setState(() {
        duration = durationSong;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((positionSong){
      // print('Current $p');
        setState(() {
          position = positionSong;
        });
    });
    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.STOPPED) {
        audioState = "Stopped";
        // position = "0:00";
      }
      if (playerState == AudioPlayerState.PLAYING) audioState = "Playing";
      if (playerState == AudioPlayerState.PAUSED) audioState = "Paused";
      setState(() {});
    });
  }
    @override
  void initState() {
    initAudio();
    playAudio();
    super.initState();
  }
  playAudio() async {
      await audioPlayer.play('https://firebasestorage.googleapis.com/v0/b/fir-9e06b.appspot.com/o/DINGRA%20KORA%20%20NEW%20SANTHALI%20VIDEO%20%20ATISH%20TUDU%20%20ASHA%20KIRAN%20TUDU%20%20SHYAM%20MARANDI%20%20RESHMA%20HEMBROM.mp3?alt=media&token=e56556a6-b458-47d0-9c1f-b4536449076f');
      
  }
  pauseAudio() async{
    await audioPlayer.pause();
    // int result = 0;
  }
  resumeAudio() async{
    await audioPlayer.resume();
    // int result = 1;
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
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            SizedBox(height: 10),
            Text('$songName', style: TextStyle(color: Colors.black, fontSize: 30)),
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
              padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 30,
//                 color:Colors.red,
                    child: Text(position.toString().split('.').first),
                  ),
                  Container(
                    width: 30,
//                 color:Colors.green,
                    child: Text(duration.toString().split('.').first),
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
                    icon: Icon(_isFavourite ? Icons.favorite : Icons.favorite_border, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _isFavourite = !_isFavourite;
                      });
                    }),
                IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () {}),
                FlatButton(
                    child: Icon(_isPlaying ? Icons.play_circle_outline : Icons.pause_circle_filled_rounded , size: 50, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _isPlaying ? resumeAudio():pauseAudio();
                        _isPlaying = !_isPlaying;
                      });
                    }),
                IconButton(icon: Icon(Icons.arrow_forward, color: Colors.black), onPressed: () {}),
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

