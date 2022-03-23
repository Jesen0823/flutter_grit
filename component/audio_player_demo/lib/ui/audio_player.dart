import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const AudioPlayerWidget({Key? key, required this.audioPlayer})
      : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String path = "";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  List<IconData> _icons = [
    Icons.play_circle_fill_outlined,
    Icons.pause_circle_filled_outlined,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    this.widget.audioPlayer.setUrl(path);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
