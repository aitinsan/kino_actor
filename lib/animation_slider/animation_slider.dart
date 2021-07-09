import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/icon_painter.dart';
import 'package:kino_actor/animation_slider/radio_button_painter.dart';

class AnimationSlider extends StatefulWidget {
  const AnimationSlider({Key? key}) : super(key: key);

  @override
  State<AnimationSlider> createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider>
    with TickerProviderStateMixin<AnimationSlider> {
  late AnimationController _controllerCircle1;
  late AnimationController _controllerIcon1;
  late AnimationController _controllerCircle2;
  late AnimationController _controllerIcon2;
  late AnimationController _controllerCircle3;
  late AnimationController _controllerIcon3;
  bool _isSelectedFirst = false;
  bool _isSelectedSecond = true;
  bool _isSelectedThird = false;
  double _currentSliderValue = 200;

  @override
  void initState() {
    super.initState();
    _controllerCircle1 = AnimationController(
      duration: Duration(seconds: 0),
      reverseDuration: Duration(seconds: 0),
      vsync: this,
    );

    _controllerCircle1.value = 1.0;
    _controllerIcon1 = AnimationController(
      duration: Duration(seconds: 0),
      reverseDuration: Duration(seconds: 0),
      vsync: this,
    );

    _controllerIcon1.value = 0.0;

    _controllerCircle2 = AnimationController(
      duration: Duration(seconds: 0),
      reverseDuration: Duration(seconds: 0),
      vsync: this,
    );

    _controllerCircle2.value = 0.0;
    _controllerIcon2 = AnimationController(
      duration: Duration(seconds: 0),
      reverseDuration: Duration(seconds: 0),
      vsync: this,
    );
    _controllerIcon2.value = 1.0;

    _controllerCircle3 = AnimationController(
      duration: Duration(seconds: 0),
      reverseDuration: Duration(seconds: 0),
      vsync: this,
    );

    _controllerCircle3.value = 1.0;
    _controllerIcon3 = AnimationController(
      duration: Duration(seconds: 0),
      reverseDuration: Duration(seconds: 0),
      vsync: this,
    );
    _controllerIcon3.value = 0.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controllerCircle1.duration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerCircle1.reverseDuration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerCircle1..addListener(changeBackFirst);
    _controllerIcon1.duration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerIcon1.reverseDuration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerIcon1..addListener(changeBackFirst);

    _controllerCircle2.duration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerCircle2.reverseDuration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerCircle2..addListener(changedSecond);
    _controllerIcon2.duration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerIcon2.reverseDuration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerIcon2..addListener(changedSecond);

    _controllerCircle3.duration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerCircle3.reverseDuration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerCircle3..addListener(changeBackThird);
    _controllerIcon3.duration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerIcon3.reverseDuration =
        Duration(milliseconds: _currentSliderValue.round());
    _controllerIcon3..addListener(changeBackThird);
  }

  @override
  void dispose() {
    _controllerIcon1.dispose();
    _controllerCircle1.dispose();
    _controllerIcon2.dispose();
    _controllerCircle2.dispose();
    _controllerIcon3.dispose();
    _controllerCircle3.dispose();
    super.dispose();
  }

  void changedFirst() {
    setState(() {
      if (_controllerCircle1.value == 1.0) {
        _isSelectedFirst = false;
        _controllerCircle1.removeListener(changedFirst);
        _controllerCircle1.addListener(changeBackFirst);
        if (_controllerIcon1.value == 0.0) {
          _controllerIcon1.removeListener(changedFirst);
          _controllerIcon1.addListener(changeBackFirst);
          _controllerIcon1.reset();
        }
      }
      _controllerIcon1.reverse();
      _controllerCircle1.forward();
    });
  }

  void changeBackFirst() {
    setState(() {
      if (_controllerCircle1.value == 0.0) {
        _isSelectedFirst = true;

        if (_controllerIcon1.value == 1.0) {
          _controllerIcon1.removeListener(changeBackFirst);
          _controllerIcon1.addListener(changedFirst);
          _controllerCircle1.removeListener(changeBackFirst);
          _controllerCircle1.addListener(changedFirst);
          _controllerCircle1.reset();
        }
      }

      _controllerCircle1.reverse();
      _controllerIcon1.forward();
    });
  }

  void changedSecond() {
    setState(() {
      if (_controllerCircle2.value == 1.0) {
        _isSelectedSecond = false;
        _controllerCircle2.removeListener(changedSecond);
        _controllerCircle2.addListener(changeBackSecond);
        if (_controllerIcon2.value == 0.0) {
          _controllerIcon2.removeListener(changedSecond);
          _controllerIcon2.addListener(changeBackSecond);
          _controllerIcon2.reset();
        }
      }
      _controllerIcon2.reverse();
      _controllerCircle2.forward();
    });
  }

  void changeBackSecond() {
    setState(() {
      if (_controllerCircle2.value == 0.0) {
        _isSelectedSecond = true;

        if (_controllerIcon2.value == 1.0) {
          _controllerIcon2.removeListener(changeBackSecond);
          _controllerIcon2.addListener(changedSecond);
          _controllerCircle2.removeListener(changeBackSecond);
          _controllerCircle2.addListener(changedSecond);
          _controllerCircle2.reset();
        }
      }

      _controllerCircle2.reverse();
      _controllerIcon2.forward();
    });
  }

  void changedThird() {
    setState(() {
      if (_controllerCircle3.value == 1.0) {
        _isSelectedThird = false;
        _controllerCircle3.removeListener(changedThird);
        _controllerCircle3.addListener(changeBackThird);
        if (_controllerIcon3.value == 0.0) {
          _controllerIcon3.removeListener(changedThird);
          _controllerIcon3.addListener(changeBackThird);
          _controllerIcon3.reset();
        }
      }
      _controllerIcon3.reverse();
      _controllerCircle3.forward();
    });
  }

  void changeBackThird() {
    setState(() {
      if (_controllerCircle3.value == 0.0) {
        _isSelectedThird = true;

        if (_controllerIcon3.value == 1.0) {
          _controllerIcon3.removeListener(changeBackThird);
          _controllerIcon3.addListener(changedThird);
          _controllerCircle3.removeListener(changeBackThird);
          _controllerCircle3.addListener(changedThird);
          _controllerCircle3.reset();
        }
      }

      _controllerCircle3.reverse();
      _controllerIcon3.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_isSelectedThird);
    print(_controllerCircle3.value);
    print(_controllerIcon3.value);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (_isSelectedFirst) {
                  } else {
                    changeBackFirst();
                    changedSecond();

                    changedThird();
                  }
                },
                child: CustomPaint(
                  isComplex: true,
                  willChange: true,
                  painter: EmptyRadioButtonPainter(
                    color: Colors.blue,
                    animationValue: _controllerCircle1.value,
                  ),
                  child: CustomPaint(
                    willChange: true,
                    painter:
                        IconPainter(animationValue: _controllerIcon1.value),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_isSelectedSecond) {
                  } else {
                    changeBackSecond();
                    changedFirst();
                    changedThird();
                  }
                },
                child: CustomPaint(
                  isComplex: true,
                  willChange: true,
                  painter: EmptyRadioButtonPainter(
                    color: Colors.green,
                    animationValue: _controllerCircle2.value,
                  ),
                  child: CustomPaint(
                    willChange: true,
                    painter:
                        IconPainter(animationValue: _controllerIcon2.value),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_isSelectedThird) {
                  } else {
                    changeBackThird();
                    changedFirst();
                    changedSecond();
                  }
                },
                child: CustomPaint(
                  isComplex: true,
                  willChange: true,
                  painter: EmptyRadioButtonPainter(
                    color: Colors.yellow,
                    animationValue: _controllerCircle3.value,
                  ),
                  child: CustomPaint(
                    willChange: true,
                    painter:
                        IconPainter(animationValue: _controllerIcon3.value),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              "Animation duration ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Slider(
            value: _currentSliderValue,
            min: 200,
            max: 2000,
            divisions: 1800,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
                _controllerCircle1.duration =
                    Duration(milliseconds: value.round());
                _controllerIcon1.duration =
                    Duration(milliseconds: value.round());
                _controllerCircle1.reverseDuration =
                    Duration(milliseconds: value.round());
                _controllerIcon1.reverseDuration =
                    Duration(milliseconds: value.round());

                _controllerCircle2.duration =
                    Duration(milliseconds: value.round());
                _controllerIcon2.duration =
                    Duration(milliseconds: value.round());
                _controllerCircle2.reverseDuration =
                    Duration(milliseconds: value.round());
                _controllerIcon2.reverseDuration =
                    Duration(milliseconds: value.round());

                _controllerCircle3.duration =
                    Duration(milliseconds: value.round());
                _controllerIcon3.duration =
                    Duration(milliseconds: value.round());
                _controllerCircle3.reverseDuration =
                    Duration(milliseconds: value.round());
                _controllerIcon3.reverseDuration =
                    Duration(milliseconds: value.round());
              });
            },
          ),
          Center(
            child: Text("${_currentSliderValue.round()} ms"),
          ),
        ],
      ),
    );
  }
}
