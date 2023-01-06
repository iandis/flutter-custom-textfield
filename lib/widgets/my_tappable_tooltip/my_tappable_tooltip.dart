import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_textfield/shared/entities/keyed_string.dart';
import 'package:flutter_custom_textfield/widgets/my_tooltip/my_tooltip.dart';

class MyTappableTooltip extends StatefulWidget {
  const MyTappableTooltip({
    super.key,
    required this.iconData,
    this.iconSize = 24,
    this.iconColor = Colors.blue,
    this.tooltipBorderRadius = const BorderRadius.all(Radius.circular(6)),
    this.tooltipColor = Colors.blue,
    this.tooltipTextColor = Colors.white,
    this.tooltipAlignment = Alignment.topCenter,
    this.tooltipDirection = AxisDirection.up,
    this.tooltipMargin = const EdgeInsets.all(8.0),
    this.tooltipTailBaseWidth = 9.0,
    this.tooltipTailLength = 12.0,
    this.tooltipDuration = const Duration(milliseconds: 2000),
    this.tooltipPosition = 0.0,
    required this.text,
  });

  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final BorderRadius tooltipBorderRadius;
  final Color tooltipColor;
  final Color tooltipTextColor;
  final Alignment tooltipAlignment;

  final AxisDirection tooltipDirection;
  final Duration tooltipDuration;
  final EdgeInsetsGeometry tooltipMargin;
  final double tooltipTailBaseWidth;
  final double tooltipTailLength;

  /// {@macro my_tooltip.MyTooltip.position}
  final double tooltipPosition;

  /// The text to show on the tooltip
  final KeyedString text;

  @override
  State<MyTappableTooltip> createState() => _MyTappableTooltipState();
}

class _MyTappableTooltipState extends State<MyTappableTooltip> {
  final MyTooltipKey _tooltipKey = MyTooltipKey();

  @override
  void initState() {
    super.initState();
    _scheduleShowTooltip();
  }

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
      key: _tooltipKey,
      alignment: widget.tooltipAlignment,
      direction: widget.tooltipDirection,
      position: widget.tooltipPosition,
      duration: widget.tooltipDuration,
      margin: widget.tooltipMargin,
      backgroundColor: widget.tooltipColor,
      borderRadius: widget.tooltipBorderRadius,
      tailBaseWidth: widget.tooltipTailBaseWidth,
      tailLength: widget.tooltipTailLength,
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          widget.text.value,
          style: TextStyle(color: widget.tooltipTextColor),
        ),
      ),
      child: GestureDetector(
        onTap: _toggleTooltip,
        child: Icon(
          widget.iconData,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(MyTappableTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_shouldUpdateTooltip(oldWidget)) return;
    if (_isTooltipShowing) {
      _updateTooltip();
    } else if (oldWidget.text != widget.text) {
      // only reshow the tooltip if the text has changed
      _scheduleShowTooltip();
    }
  }

  bool _shouldUpdateTooltip(MyTappableTooltip oldWidget) {
    return oldWidget.tooltipAlignment != widget.tooltipAlignment ||
        oldWidget.tooltipDirection != widget.tooltipDirection ||
        oldWidget.tooltipDuration != widget.tooltipDuration ||
        oldWidget.tooltipMargin != widget.tooltipMargin ||
        oldWidget.tooltipPosition != widget.tooltipPosition ||
        oldWidget.tooltipTailBaseWidth != widget.tooltipTailBaseWidth ||
        oldWidget.tooltipTailLength != widget.tooltipTailLength ||
        oldWidget.tooltipColor != widget.tooltipColor ||
        oldWidget.tooltipBorderRadius != widget.tooltipBorderRadius ||
        oldWidget.tooltipTextColor != widget.tooltipTextColor ||
        oldWidget.text != widget.text;
  }

  bool get _isTooltipShowing => _tooltipKey.currentState?.isShowing == true;

  void _scheduleShowTooltip() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _showTooltip();
    });
  }

  void _showTooltip() {
    _tooltipKey.currentState?.showTooltip();
  }

  void _hideTooltip() {
    _tooltipKey.currentState?.hideTooltip();
  }

  void _toggleTooltip() {
    if (_isTooltipShowing) {
      _hideTooltip();
    } else {
      _showTooltip();
    }
  }

  void _updateTooltip() {
    _tooltipKey.currentState?.updateTooltip();
  }
}
