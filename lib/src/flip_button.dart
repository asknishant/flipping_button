import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(FlipHome());
}

class FlipHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: FlippingButton(
            textStyle: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
            color: Colors.blue,
            background: Colors.yellow,
            leftLabel: 'Left',
            rightLabel: 'Right',
            onChange: (bool isLeftActive) {
              //Switch between tabs or do any other task.
            },
            btnWidth: 250,
            radius: 32,
            btnHeight: 64,
          ),
        ),
      ),
    );
  }
}

class FlippingButton extends StatefulWidget {
  final Color color;
  final Color background;
  final String leftLabel;
  final String rightLabel;
  final double btnWidth;
  final double btnHeight;
  final TextStyle textStyle;
  final double radius;
  final void Function(bool isLeftActive) onChange;

  const FlippingButton({
    Key key,
    this.color,
    this.btnWidth,
    this.btnHeight,
    this.background,
    this.leftLabel,
    this.rightLabel,
    this.onChange,
    this.textStyle,
    this.radius,
  }) : super(key: key);

  @override
  _FlippingButtonState createState() => _FlippingButtonState();
}

class _FlippingButtonState extends State<FlippingButton>
    with SingleTickerProviderStateMixin {
  AnimationController _flipController;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    _shiftPosition(true);
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _shiftPosition(bool leftEnabled) {
    _flipController.value = leftEnabled ? 1.0 : 0.0;
  }

  void _switchState() {
    if (_flipController.isCompleted) {
      _flipController.reverse();

      widget.onChange?.call(false);
    } else {
      _flipController.forward();
      widget.onChange?.call(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _buildBtnBackground(),
      AnimatedBuilder(
          animation: _flipController,
          builder: (context, snapshot) {
            return _buildFlippingBtn(pi * _flipController.value);
          }),
    ]);
  }

  Widget _buildBtnBackground() {
    return GestureDetector(
      onTap: _switchState,
      child: Container(
        width: widget.btnWidth,
        height: widget.btnHeight,
        decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(width: 5, color: widget.color)),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(widget.leftLabel, style: widget.textStyle),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(widget.rightLabel, style: widget.textStyle),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFlippingBtn(double angle) {
    final isLeft = angle > (pi / 2);
    final transformAngle = isLeft ? angle - pi : angle;

    return Positioned(
      top: 0,
      bottom: 0,
      right: isLeft ? null : 0,
      left: isLeft ? 0 : null,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002) //Perspective matrix
          ..rotateY(transformAngle),
        alignment:
            isLeft ? FractionalOffset(1.0, 1.0) : FractionalOffset(0.0, 1.0),
        child: Container(
          width: widget.btnWidth / 2,
          height: widget.btnHeight,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.only(
                topRight: isLeft ? Radius.zero : Radius.circular(widget.radius),
                bottomRight:
                    isLeft ? Radius.zero : Radius.circular(widget.radius),
                topLeft: isLeft ? Radius.circular(widget.radius) : Radius.zero,
                bottomLeft:
                    isLeft ? Radius.circular(widget.radius) : Radius.zero,
              )),
          child: Center(
            child: Text(
              isLeft ? widget.leftLabel : widget.rightLabel,
              style: TextStyle(
                  color: widget.background,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
