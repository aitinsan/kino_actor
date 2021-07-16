import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart' as player;

class SoundPlayer extends ChangeNotifier {
  static const double controlSize = 56;
  static const double deleteBtnSize = 24;
  late player.AudioPlayer _audioPlayer = player.AudioPlayer();

  late StreamSubscription<player.PlayerState> playerStateChangedSubscription;

  late StreamSubscription<Duration?> durationChangedSubscription;
  late StreamSubscription<Duration> positionChangedSubscription;

  get audioPlayer => _audioPlayer;
  //set audioPlayer(value) => _audioPlayer = value;

  Future<void> init(source) async {
    playerStateChangedSubscription = audioPlayer.playerStateStream.listen(
      (state) async {
        if (state.processingState == audioPlayer.ProcessingState.completed) {
          await stop();
        }
      },
    );
    
    await _audioPlayer.setAudioSource(source);
  }

  Future<void> play() {
    return _audioPlayer.play();
  }

  Future<void> pause() {
    return _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    print('is playing? ${_audioPlayer.playing}');
    return _audioPlayer.seek(const Duration(milliseconds: 0));
  }

  void stopPlayer(onDelete) {
    _audioPlayer.stop().then((value) => onDelete());
  }
}
