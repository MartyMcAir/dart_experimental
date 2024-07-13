import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const AudioPlayerApp());
}

class AudioPlayerApp extends StatelessWidget {
  const AudioPlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AudioPlayerPage(title: 'Audio Player'),
    );
  }
}

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;
  String _audioUrl =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  @override
  void initState() {
    super.initState();
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  void _playAudio() async {
    await _audioPlayer.play(UrlSource(_audioUrl));
  }

  void _pauseAudio() async {
    await _audioPlayer.pause();
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Audio Player State: $_playerState',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _playerState == PlayerState.playing
                  ? _pauseAudio
                  : _playAudio,
              child:
                  Text(_playerState == PlayerState.playing ? 'Pause' : 'Play'),
            ),
            ElevatedButton(
              onPressed: _stopAudio,
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
