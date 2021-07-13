import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/custom_painter/empty_radio_button_painter.dart';
import 'package:kino_actor/animation_slider/custom_painter/icon_painter.dart';

class RadioButton<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final Color colour;
  final ValueChanged<T?>? onChanged;
  final Duration animatedDuration;
  bool get _selected => value == groupValue;

  RadioButton(
      {Key? key,
      required this.animatedDuration,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.colour})
      : super(key: key);

  @override
  _RadioButtonState<T> createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerCircle = AnimationController(
    duration: Duration(seconds: 2),
    reverseDuration: Duration(seconds: 2),
    vsync: this,
  );

  late Animation<double> circleButtomAnimation;
  late Animation<double> iconButtomAnimation;

  @override
  void initState() {
    super.initState();

    if (widget._selected) {
      _controllerCircle.value = 0.0;
    } else {
      _controllerCircle.value = 1.0;
    }
    circleButtomAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controllerCircle,
      curve: Interval(
        0.6,
        1.0,
      ),
    ));

    iconButtomAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controllerCircle,
      curve: Interval(
        0.0,
        0.4,
      ),
    ));
  }

  @override
  void didUpdateWidget(RadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    //print('widget selected in ${widget.value} is  ${widget._selected}');
    if (widget._selected != oldWidget._selected) {
      if (widget._selected) {
        _controllerCircle.reverse();
      } else {
        _controllerCircle.forward();
      }
    }
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return InkWell(
      onTap: () {
        widget.onChanged!(widget.value);
      },
      child: CustomPaint(
        isComplex: true,
        willChange: true,
        painter: EmptyRadioButtonPainter(
          color: widget.colour,
          animationValue: circleButtomAnimation.value,
        ),
        child: CustomPaint(
          willChange: true,
          painter: IconPainter(animationValue: iconButtomAnimation.value),
          child: Padding(
            padding: EdgeInsets.all(30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //как я понял animnation builder нужен чтобы просто оповещать _buildAnimation об изменениях.
    // Без него не controllerCircle будет меняться но передаваться в паинтер не будет. И так меньше кода получается
    return AnimatedBuilder(
        animation: _controllerCircle, builder: _buildAnimation);
  }
}
