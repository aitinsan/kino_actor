import 'dart:async';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class AudioRecorder extends StatefulWidget {
  AudioRecorder({Key? key, required this.onStop}) : super(key: key);
  final void Function(String path) onStop;
  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final _audioRecorder = Record();
  Amplitude? _amplitude;
  @override
  void initState() {
    super.initState();
    _isRecording = false;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildStartStopControl() {
    late Icon icon;
    late Color iconColor;
    if (_isRecording || _isPaused) {
      icon = Icon(
        Icons.stop,
        color: Colors.red,
        size: 30,
      );
      iconColor = Colors.red.withOpacity(0.1);
    } else {
      icon = Icon(
        Icons.mic,
        color: Colors.blue,
        size: 30,
      );
      iconColor = Colors.blue.withOpacity(0.1);
    }
    return ClipOval(
      child: Material(
          color: iconColor,
          child: InkWell(
            onTap: () {
              _isRecording ? _stop() : _start();
            },
            child: SizedBox(
              child: icon,
              width: 56,
              height: 56,
            ),
          )),
    );
  }

  Widget _buildPauseControl() {
    if (!_isPaused && !_isRecording) {
      return SizedBox.shrink();
    }
    late Icon icon;
    late Color iconColor;
    if (!_isPaused) {
      icon = Icon(
        Icons.pause,
        color: Colors.red,
        size: 30,
      );
      iconColor = Colors.red.withOpacity(0.1);
    } else {
      icon = Icon(
        Icons.play_arrow,
        color: Colors.red,
        size: 30,
      );
      iconColor = Colors.green.withOpacity(0.1);
    }
    return ClipOval(
      child: Material(
        color: iconColor,
        child: InkWell(
          onTap: () {
            _isPaused ? _resume() : _pause();
          },
          child: SizedBox(
            child: icon,
            width: 56,
            height: 56,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_isRecording || _isPaused) {
      return _buildTimer();
    }

    return Text("Waiting Record");
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);
    return Text(
      '$minutes : $seconds',
      style: TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }
    return numberStr;
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();
        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });
        _startTimer();
      }
    } catch (e) {
      print('catch start');
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    final path = await _audioRecorder.stop();
    print("this is the path: ${path!.toUpperCase()}");
    widget.onStop(path);
    setState(() => _isPaused = true);
  }

  //pause - это когда ставишь на паузу
  Future<void> _pause() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    await _audioRecorder.pause();
    setState(() => _isPaused = true);
  }

  //resume - это когда продолжаешь запись после паузы
  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();
    setState(() => _isPaused = false);
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() => _recordDuration++);
      },
    );
    _ampTimer = Timer.periodic(
      const Duration(milliseconds: 200),
      (Timer timer) async {
        _amplitude = await _audioRecorder.getAmplitude();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStartStopControl(),
            _buildPauseControl(),
            _buildText(),
          ],
        ),
        if (_amplitude != null) ...[
          Text('Current amplitude of sound: ${_amplitude?.current ?? 0.0}'),
        ]
      ],
    );
  }
}
