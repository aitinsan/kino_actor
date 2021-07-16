import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:record/record.dart';

class RecordSound extends ChangeNotifier {

  bool isRecording = false;
  bool isPaused = false;
  int recordDuration = 0;
  Timer? timer;
  Timer? ampTimer;
  final audioRecorder = Record();
  Amplitude? amplitude;
  VoidCallback? setState;
  
  //RecordSound(this.setState);

  String formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }
    return numberStr;
  }

  Future<void> start() async {
    try {
      if (await audioRecorder.hasPermission()) {
        notifyListeners();
        await audioRecorder.start();
        bool isRecording = await audioRecorder.isRecording();

        //setState(() {
          isRecording = isRecording;
          recordDuration = 0;
        
        startTimer();
        
      }
    } catch (e) {
      print('catch start');
    }
  }

  Future<void> stop(onStop) async {
    timer?.cancel();
    ampTimer?.cancel();
    final path = await audioRecorder.stop();
    print("this is the path: ${path!.toUpperCase()}");
    onStop(path);
    //setState(() => isPaused = true);
    isPaused = true;
    notifyListeners();
  }

  //pause - это когда ставишь на паузу
  Future<void> pause() async {
    timer?.cancel();
    ampTimer?.cancel();
    await audioRecorder.pause();
    //setState(() => isPaused = true);
    isPaused = true;
    notifyListeners();
  }

  //resume - это когда продолжаешь запись после паузы
  Future<void> resume() async {
    startTimer();
    await audioRecorder.resume();
    //setState(() => isPaused = false);
    isPaused = false;
    notifyListeners();
  }

  void startTimer() {
    timer?.cancel();
    ampTimer?.cancel();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        //setState(() => recordDuration++);
        recordDuration++;
        notifyListeners();
      },
    );
    ampTimer = Timer.periodic(
      const Duration(milliseconds: 200),
      (Timer timer) async {
        amplitude = await audioRecorder.getAmplitude();
        //setState(() {});
        notifyListeners();
      },
    );
  }
}
