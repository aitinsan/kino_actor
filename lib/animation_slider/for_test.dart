import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/icon_painter.dart';
import 'package:kino_actor/animation_slider/radio_button_painter.dart';

class AnimationRotate extends StatefulWidget {
  const AnimationRotate({Key? key}) : super(key: key);

  @override
  State<AnimationRotate> createState() => _AnimationRotateState();
}

class _AnimationRotateState extends State<AnimationRotate>
    with TickerProviderStateMixin<AnimationRotate> {
  late final AnimationController _controllerCircle = AnimationController(
    duration: const Duration(seconds: 3),
    reverseDuration: const Duration(seconds: 3),
    vsync: this,
  )..addListener(changed);
  late final AnimationController _controllerIcon = AnimationController(
    duration: const Duration(seconds: 3),
    reverseDuration: const Duration(seconds: 3),
    vsync: this,
  )..addListener(changed);

  bool isSelectedFirst = true;
  bool isSelectedSecond = false;

  @override
  void dispose() {
    _controllerIcon.dispose();
    _controllerCircle.dispose();
    super.dispose();
  }

  void changed() {
    setState(
      () {
        if (_controllerCircle.isCompleted && _controllerIcon.isCompleted) {
          _controllerCircle.reset();
          _controllerIcon.reset();
          bool n = isSelectedFirst;
          isSelectedFirst = isSelectedSecond;
          isSelectedSecond = n;
        } else {
          _controllerCircle.forward();
          _controllerIcon.forward();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  changed();
                  _controllerIcon.forward();
                },
                child: CustomPaint(
                  willChange: true,
                  painter: EmptyRadioButtonPainter(
                    color: Colors.blue,
                    isSelected: isSelectedFirst,
                    animationValue: _controllerCircle.value,
                  ),
                  child: CustomPaint(
                    willChange: true,
                    painter: IconPainter(
                        isSelected: isSelectedFirst,
                        animationValue: _controllerIcon.value),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  changed();
                },
                child: CustomPaint(
                  painter: EmptyRadioButtonPainter(
                    color: Colors.green,
                    isSelected: isSelectedSecond,
                    animationValue: _controllerCircle.value,
                  ),
                  child: CustomPaint(
                    painter: IconPainter(
                      isSelected: isSelectedSecond,
                      animationValue: _controllerIcon.value,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
