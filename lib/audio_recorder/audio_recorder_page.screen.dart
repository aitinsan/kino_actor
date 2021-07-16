import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as audioPlayer;
import 'package:kino_actor/audio_recorder/player/audio_player.dart';
import 'package:kino_actor/audio_recorder/record/audio_recorder.dart';
import 'package:kino_actor/audio_recorder/services/soundPlayer.service.dart';
import 'package:provider/provider.dart';

class AudioRecorderPage extends StatefulWidget {
  @override
  _AudioRecorderPageState createState() => _AudioRecorderPageState();
}

class _AudioRecorderPageState extends State<AudioRecorderPage> {
  bool showPlayer = false;
  audioPlayer.AudioSource? audioSource;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  Widget _playerPage(context) {
    return ChangeNotifierProvider<SoundPlayer>(
      create: (context) => SoundPlayer(),
      child: Consumer<SoundPlayer>(
        builder: (context, vm, _) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: AudioPlayer(
            source: audioSource!,
            onDelete: () {
              setState(() => showPlayer = false);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? _playerPage(context)
              : AudioRecorder(
                  onStop: (path) {
                    setState(() {
                      audioSource =
                          audioPlayer.AudioSource.uri(Uri.parse(path));
                      showPlayer = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
