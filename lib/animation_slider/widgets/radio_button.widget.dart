import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/custom_painter/empty_radio_button_painter.dart';
import 'package:kino_actor/animation_slider/custom_painter/icon_painter.dart';

class RadioButton<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  Color colour;
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
    with TickerProviderStateMixin {
  // late AnimationController _controllerCircle;
  // late AnimationController _controllerIcon;
  late AnimationController _controllerCircle = AnimationController(
    duration: Duration(seconds: 0),
    reverseDuration: Duration(seconds: 0),
    vsync: this,
  );
  late AnimationController _controllerIcon = AnimationController(
    duration: Duration(seconds: 0),
    reverseDuration: Duration(seconds: 0),
    vsync: this,
  );
  late Animation<double> circleButtomAnimation;
  late Animation<double> iconButtomAnimation;

  @override
  void initState() {
    super.initState();

    if (widget._selected) {
      _controllerCircle.value = 0.0;
      _controllerIcon.value = 1.0;
    } else {
      _controllerCircle.value = 1.0;
      _controllerIcon.value = 0.0;
    }
    circleButtomAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controllerCircle,
      curve: Interval(
        0.0,
        0.500,
        curve: Curves.linear,
      ),
    ));

    iconButtomAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controllerCircle,
      curve: Interval(
        0.0,
        1.0,
        curve: Curves.linear,
      ),
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controllerCircle.duration = widget.animatedDuration;
    _controllerCircle.reverseDuration = widget.animatedDuration;
    _controllerCircle..addListener(changeBack);
    _controllerIcon.duration = widget.animatedDuration;
    _controllerIcon.reverseDuration = widget.animatedDuration;
    _controllerIcon..addListener(changeBack);

    if (widget._selected) {
      changeBack();
    } else {
      changed();
    }
  }

  @override
  void dispose() {
    _controllerCircle.dispose();
    _controllerIcon.dispose();
    super.dispose();
  }

  void changed() {
    setState(() {
      if (_controllerCircle.value == 1.0) {
        _controllerCircle.removeListener(changed);
        _controllerCircle.addListener(changeBack);
        if (_controllerIcon.value == 0.0) {
          _controllerIcon.removeListener(changed);
          _controllerIcon.addListener(changeBack);
          _controllerIcon.reset();
        }
      }
      _controllerIcon.reverse();
      _controllerCircle.forward();
    });
  }

  void changeBack() {
    setState(
      () {
        if (_controllerCircle.value == 0.0) {
          if (_controllerIcon.value == 1.0) {
            _controllerIcon.removeListener(changeBack);
            _controllerIcon.addListener(changed);
            _controllerCircle.removeListener(changeBack);
            _controllerCircle.addListener(changed);
            _controllerCircle.reset();
          }
        }

        _controllerCircle.reverse();
        _controllerIcon.forward();
      },
    );
  }

  @override
  void didUpdateWidget(RadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    //print('widget selected in ${widget.value} is  ${widget._selected}');
    if (widget._selected != oldWidget._selected) {
      if (widget._selected) {
        changeBack();
      } else {
        changed();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
}
