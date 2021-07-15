import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:kino_actor/audio_recorder/audio_player.dart';
import 'package:kino_actor/audio_recorder/audio_recorder.dart';

class AudioRecorderPage extends StatefulWidget {
  @override
  _AudioRecorderPageState createState() => _AudioRecorderPageState();
}

class _AudioRecorderPageState extends State<AudioRecorderPage> {
  bool showPlayer = false;
  ap.AudioSource? audioSource;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: AudioPlayer(
                    source: audioSource!,
                    onDelete: () {
                      setState(() => showPlayer = false);
                    },
                  ),
                )
              : AudioRecorder(
                  onStop: (path) {
                    setState(() {
                      audioSource = ap.AudioSource.uri(Uri.parse(path));
                      showPlayer = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
