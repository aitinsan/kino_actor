import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kino_actor/animation_slider/icon_painter.dart';
import 'package:kino_actor/animation_slider/radio_button_painter.dart';

class AnimationSlider extends StatefulWidget {
  const AnimationSlider({Key? key}) : super(key: key);

  @override
  State<AnimationSlider> createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider>
    with TickerProviderStateMixin<AnimationSlider> {
  late AnimationController _controllerCircle;
  late AnimationController _controllerCircle2;
  late AnimationController _controllerIcon;
  late double _currentSliderValue = 1000;
  late bool isSelectedFirst;
  late bool isSelectedSecond;
  late bool animate;
  @override
  void initState() {
    super.initState();
    animate = true;
    isSelectedFirst = true;
    isSelectedSecond = false;
    _controllerCircle = AnimationController(
        duration: Duration(milliseconds: (_currentSliderValue / 2).round()),
        reverseDuration:
            Duration(milliseconds: (_currentSliderValue / 2).round()),
        vsync: this);
    _controllerCircle.addListener(_update);
    _controllerCircle.forward();

    _controllerCircle2 = AnimationController(
        duration: Duration(milliseconds: (_currentSliderValue / 2).round()),
        reverseDuration:
            Duration(milliseconds: (_currentSliderValue / 2).round()),
        vsync: this);
    _controllerCircle2.addListener(_update);
    _controllerCircle2.forward();

    _controllerIcon = AnimationController(
        duration: Duration(milliseconds: (_currentSliderValue / 2).round()),
        reverseDuration:
            Duration(milliseconds: (_currentSliderValue / 2).round()),
        vsync: this);
    _controllerIcon.addListener(_update);
    _controllerIcon.forward();
  }

  void _update() {
    setState(() {
      animate = true;
    });
  }

  @override
  void dispose() {
    _controllerCircle.dispose();
    _controllerIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Theme.of(context).cardColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: InkWell(
                    onTap: () {
                      if (isSelectedSecond == false) {
                        isSelectedFirst = false;
                        isSelectedSecond = true;
                        _controllerCircle.reset();
                        _controllerCircle.forward();
                        _controllerIcon.reset();

                        setState(() {});
                      }
                      if (_controllerCircle.isCompleted) {
                        _controllerIcon.reset();
                        _controllerIcon.forward();
                      }
                    },
                    child: CustomPaint(
                      willChange: true,
                      painter: EmptyRadioButtonPainter(
                        color: Colors.blue,
                        isSelected: isSelectedFirst,
                        animationValue: _controllerCircle.value,
                      ),
                      child: CustomPaint(
                        painter: IconPainter(
                            isSelected: isSelectedFirst,
                            animationValue: _controllerIcon.value),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: InkWell(
                    onTap: () {
                      if (isSelectedFirst == false) {
                        isSelectedFirst = true;
                        isSelectedSecond = false;
                        _controllerCircle2.reset();
                        _controllerCircle2.forward();
                        _controllerIcon.reset();

                        setState(() {});
                      }
                      if (_controllerCircle2.isCompleted) {
                        _controllerIcon.reset();
                        _controllerIcon.forward();
                      }
                    },
                    child: CustomPaint(
                      painter: EmptyRadioButtonPainter(
                        color: Colors.green,
                        isSelected: isSelectedSecond,
                        animationValue: _controllerCircle2.value,
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
                setState(() {});
              },
            ),
            Center(
              child: Text("${_currentSliderValue.round()} ms"),
            ),
          ],
        ),
      ),
    );
  }
}

