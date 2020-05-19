import 'dart:math';
import 'package:flutter/material.dart';

class CircularList extends StatelessWidget {
  final List<Widget> children;
  final Widget centerWidget;

  const CircularList({
    Key key,
    @required this.children,
    this.centerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final outerCircleDiameter = min(size.width, size.height);
    final outerRadius = outerCircleDiameter / 2.0;
    final betweenRadius = outerRadius * 0.57;

    final minChildCountDivior = max(children.length, 7);
    final maxChildDiameter = 240.0;
    final centerWidgetDiameter = min(outerRadius * 0.45, maxChildDiameter);
    final circleOutline = 2 * pi * outerRadius;
    final childrenDiameter =
        min(circleOutline / minChildCountDivior * 0.5, maxChildDiameter);
    final topItemAngle = 0.0;
    final origin = Offset(0, -outerCircleDiameter * 0.04);

    return Container(
      width: outerCircleDiameter,
      height: outerCircleDiameter,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: origin.dx,
            top: origin.dy,
            child: Container(
              width: outerRadius * 2,
              height: outerRadius * 2,
              child: Transform.rotate(
                angle: topItemAngle,
                child: Stack(
                  children: List.generate(children.length, (index) {
                    Offset childPoint = _getChildPoint(index, children.length,
                        betweenRadius, childrenDiameter);
                    return Positioned(
                      left: outerRadius + childPoint.dx,
                      top: outerRadius + childPoint.dy,
                      child: Transform.rotate(
                        angle: -topItemAngle,
                        child: Container(
                            width: childrenDiameter,
                            height: childrenDiameter,
                            alignment: Alignment.center,
                            child: children[index]),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned(
              left: origin.dx + outerRadius - centerWidgetDiameter / 2.0,
              top: origin.dy + outerRadius - centerWidgetDiameter / 2.0,
              child: Container(
                width: centerWidgetDiameter,
                height: centerWidgetDiameter,
                alignment: Alignment.center,
                child: centerWidget ?? Container(),
              ))
        ],
      ),
    );
  }

  Offset _getChildPoint(
    int index,
    int length,
    double betweenRadius,
    double childrenDiameter,
  ) {
    const double startAngle = -pi / 2.0;
    double indexAngle = 2 * pi * (index / length);
    double angel = startAngle + indexAngle;
    double x = cos(angel) * betweenRadius - childrenDiameter / 2;
    double y = sin(angel) * betweenRadius - childrenDiameter / 2;
    return Offset(x, y);
  }
}
