import 'package:flutter/material.dart';

import 'package:kino_actor/animation_slider/radio_button_painter.dart';
import 'package:kino_actor/lightTheme.dart';

enum SingingCharacter { firstRadioButton, secondRadioButton }

/// This is the stateful widget that the main application instantiates.
class AnimationSlider extends StatefulWidget {
  const AnimationSlider({Key? key}) : super(key: key);

  @override
  State<AnimationSlider> createState() => _AnimationSliderState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AnimationSliderState extends State<AnimationSlider>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  double _currentSliderValue = 200;
  late bool isSelectedFirst;
  late bool isSelectedSecond;

  @override
  void initState() {
    super.initState();
    isSelectedFirst = true;
    isSelectedSecond = false;
    controller = AnimationController(
        duration: Duration(milliseconds: _currentSliderValue.round()),
        vsync: this);

    animation = Tween<double>(begin: 0, end: 1000).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
    animation.addListener(() {
      setState(() {
        controller.forward();
      });
    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    animation.removeListener(() {});
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ListTile(
                    selected: isSelectedFirst,
                    onTap: () {
                      if (isSelectedSecond == false) {
                        setState(
                          () {
                            if (isSelectedFirst == false) {
                              isSelectedFirst = true;
                              isSelectedSecond = false;
                            } else {
                              isSelectedFirst = false;
                              isSelectedSecond = true;
                            }
                          },
                        );
                      }
                    },
                    leading: CustomPaint(
                      painter: RadioButtonPainter(
                          color: Colors.blue, isSelected: isSelectedFirst),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ListTile(
                    selected: isSelectedSecond,
                    onTap: () {
                      if (isSelectedFirst == false) {
                        setState(
                          () {
                            if (isSelectedFirst == false) {
                              isSelectedFirst = true;
                              isSelectedSecond = false;
                            } else {
                              isSelectedFirst = false;
                              isSelectedSecond = true;
                            }
                          },
                        );
                      }
                    },
                    leading: CustomPaint(
                      painter: RadioButtonPainter(
                          color: Colors.green, isSelected: isSelectedSecond),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                "Animation duration",
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
                });
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
