import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:kino_actor/audio_recorder/services/soundPlayer.service.dart';

class AudioPlayer extends StatefulWidget {
  final AudioSource source;
  final VoidCallback onDelete;
  const AudioPlayer({
    required this.source,
    required this.onDelete,
  });
  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  late final SoundPlayer _soundTrack = SoundPlayer();

  @override
  void initState() {
    _soundTrack.playerStateChangedSubscription =
        _soundTrack.audioPlayer.playerStateStream.listen((state) async {
      if (state.processingState ==
          _soundTrack.audioPlayer.ProcessingState.completed) {
        await _soundTrack.stop();
      }
      setState(() {});
    });
    _soundTrack.positionChangedSubscription = _soundTrack
        .audioPlayer.positionStream
        .listen((position) => setState(() {}));
    _soundTrack.durationChangedSubscription = _soundTrack
        .audioPlayer.durationStream
        .listen((duration) => setState(() {}));
    _soundTrack.init(widget.source);
    super.initState();
  }

  Widget _buildControl() {
    Icon icon;
    Color color;

    if (_soundTrack.audioPlayer.playerState.playing) {
      icon = Icon(Icons.pause, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      icon = Icon(Icons.play_arrow, color: Colors.blue, size: 30);
      color = Colors.blue.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(
              width: SoundPlayer.controlSize,
              height: SoundPlayer.controlSize,
              child: icon),
          onTap: () {
            if (!_soundTrack.audioPlayer.playerState.playing) {
              _soundTrack.play();
            } else {
              _soundTrack.pause();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSlider(double widgetWidth) {
    final position = _soundTrack.audioPlayer.position;
    final duration = _soundTrack.audioPlayer.duration;
    bool canSetValue = false;
    if (duration != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    double width =
        widgetWidth - SoundPlayer.controlSize - SoundPlayer.deleteBtnSize;
    width -= SoundPlayer.deleteBtnSize;

    return SizedBox(
      width: width,
      child: Slider(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).accentColor,
        onChanged: (v) {
          if (duration != null) {
            final position = v * duration.inMilliseconds;
            _soundTrack.audioPlayer
                .seek(Duration(milliseconds: position.round()));
            
          }
        },
        value: canSetValue && duration != null
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildControl(),
            _buildSlider(constraints.maxWidth),
            IconButton(
              icon: Icon(Icons.delete,
                  color: const Color(0xFF73748D),
                  size: SoundPlayer.deleteBtnSize),
              onPressed: () {
                
                 _soundTrack.some(widget.onDelete);
              },
            ),
          ],
        );
      },
    );
  }
}
