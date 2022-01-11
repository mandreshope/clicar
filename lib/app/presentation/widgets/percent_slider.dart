import 'dart:math' as math;

import 'package:flutter/material.dart';

class PercentSlider extends StatefulWidget {
  final int max;
  final int min;
  final int value;
  final String unit;
  final Color? primaryColor;
  final Color? accentColor;
  final Color? numberLineColor;
  final Color? currentHeightTextColor;
  final Color? sliderCircleColor;
  final ValueChanged<int> onChange;
  final Color? backgroundColor;

  const PercentSlider({
    Key? key,
    required this.value,
    required this.onChange,
    this.max = 100,
    this.min = 0,
    this.unit = '%',
    this.primaryColor,
    this.accentColor,
    this.numberLineColor,
    this.currentHeightTextColor,
    this.sliderCircleColor,
    this.backgroundColor,
  }) : super(key: key);

  int get totalUnits => max - min;

  @override
  _PercentSliderState createState() => _PercentSliderState();
}

class _PercentSliderState extends State<PercentSlider> {
  late double startDragYOffset;
  late int startDragHeight;
  double widgetHeight = 50;
  double labelFontSize = 12.0;

  double get _pixelsPerUnit {
    return _drawingHeight / widget.totalUnits;
  }

  double get _sliderPosition {
    double halfOfBottomLabel = labelFontSize / 2;
    int unitsFromBottom = widget.value - widget.min;
    return halfOfBottomLabel + unitsFromBottom * _pixelsPerUnit;
  }

  double get _drawingHeight {
    double totalHeight = widgetHeight;
    double marginBottom = 12.0;
    double marginTop = 12.0;
    return totalHeight - (marginBottom + marginTop + labelFontSize);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: LayoutBuilder(builder: (context, constraints) {
        widgetHeight = constraints.maxHeight;
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: _onTapDown,
          onVerticalDragStart: _onDragStart,
          onVerticalDragUpdate: _onDragUpdate,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              _drawBackground(constraints.maxWidth),
              _drawLabels(),
              _drawSlider(),
            ],
          ),
        );
      }),
    );
  }

  _onTapDown(TapDownDetails tapDownDetails) {
    int height = _globalOffsetToHeight(tapDownDetails.globalPosition);
    widget.onChange(_normalizeHeight(height));
  }

  int _normalizeHeight(int height) {
    return math.max(widget.min, math.min(widget.max, height));
  }

  int _globalOffsetToHeight(Offset globalOffset) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    Offset localPosition = getBox.globalToLocal(globalOffset);
    double dy = localPosition.dy;
    dy = dy - 12.0 - labelFontSize / 2;
    int height = widget.max - (dy ~/ _pixelsPerUnit);
    return height;
  }

  _onDragStart(DragStartDetails dragStartDetails) {
    int newHeight = _globalOffsetToHeight(dragStartDetails.globalPosition);
    widget.onChange(newHeight);
    setState(() {
      startDragYOffset = dragStartDetails.globalPosition.dy;
      startDragHeight = newHeight;
    });
  }

  _onDragUpdate(DragUpdateDetails dragUpdateDetails) {
    double currentYOffset = dragUpdateDetails.globalPosition.dy;
    double verticalDifference = startDragYOffset - currentYOffset;
    int diffHeight = verticalDifference ~/ _pixelsPerUnit;
    int height = _normalizeHeight(startDragHeight + diffHeight);
    setState(() => widget.onChange(height));
  }

  Widget _drawSlider() {
    return Positioned(
      child: PercentSliderInternal(
          value: widget.value,
          unit: widget.unit,
          primaryColor: widget.primaryColor ?? Theme.of(context).primaryColor,
          accentColor:
              widget.accentColor ?? Theme.of(context).colorScheme.secondary,
          currentHeightTextColor: widget.currentHeightTextColor ??
              Theme.of(context).colorScheme.secondary,
          sliderCircleColor:
              widget.sliderCircleColor ?? Theme.of(context).primaryColor),
      left: 0.0,
      right: 0.0,
      bottom: _sliderPosition,
    );
  }

  Widget _drawLabels() {
    int labelsToDisplay = widget.totalUnits ~/ 5 + 1;
    List<Widget> labels = List.generate(
      labelsToDisplay,
      (idx) {
        return Text(
          "${widget.max - 5 * idx}",
          style: TextStyle(
            color: widget.numberLineColor ??
                Theme.of(context).colorScheme.secondary,
            fontSize: labelFontSize,
          ),
        );
      },
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 12.0,
            bottom: 12.0,
            top: 12.0,
          ),
          child: Column(
            children: labels,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }

  Widget _drawBackground(double maxWidth) {
    double personImageHeight = _sliderPosition + 12.0;
    Color? background = Theme.of(context).highlightColor;
    if (widget.value <= 25) {
      background = Colors.red;
    } else if (widget.value <= 50) {
      background = Colors.orange;
    } else {
      background = Colors.lightGreenAccent;
    }
    widget.value;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: maxWidth,
        height: personImageHeight,
        color: background,
      ),
    );
  }
}

class PercentSliderInternal extends StatelessWidget {
  final int value;
  final String unit;
  final Color primaryColor;
  final Color accentColor;
  final Color currentHeightTextColor;
  final Color sliderCircleColor;

  const PercentSliderInternal(
      {Key? key,
      required this.value,
      required this.unit,
      required this.primaryColor,
      required this.accentColor,
      required this.currentHeightTextColor,
      required this.sliderCircleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SliderLabel(
            value: value,
            unit: unit,
            currentHeightTextColor: currentHeightTextColor,
          ),
          Row(
            children: <Widget>[
              Expanded(child: SliderLine(primaryColor: primaryColor)),
              SliderCircle(sliderCircleColor: sliderCircleColor),
            ],
          ),
        ],
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final int value;
  final String unit;
  final Color currentHeightTextColor;

  const SliderLabel(
      {Key? key,
      required this.value,
      required this.unit,
      required this.currentHeightTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$value $unit",
        style: TextStyle(
          fontSize: 16.0,
          color: currentHeightTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SliderLine extends StatelessWidget {
  final Color primaryColor;

  const SliderLine({Key? key, required this.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          40,
          (i) => Expanded(
                child: Container(
                  height: 2.0,
                  decoration: BoxDecoration(
                      color: i.isEven ? primaryColor : Colors.white),
                ),
              )),
    );
  }
}

class SliderCircle extends StatelessWidget {
  final Color sliderCircleColor;

  const SliderCircle({Key? key, required this.sliderCircleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: sliderCircleColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.unfold_more,
        color: Colors.white,
        size: 0.6 * 32.0,
      ),
    );
  }
}
