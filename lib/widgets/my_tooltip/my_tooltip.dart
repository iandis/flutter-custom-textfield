/*
Copyright (c) 2021 Rex Magana
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Copyright (c) 2022 Iandi Santulus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_textfield/widgets/my_tooltip/simple_tooltip.dart';

typedef MyTooltipKey = GlobalKey<MyTooltipState>;

/// A widget to display a tooltip over target widget. The tooltip can be
/// displayed on any axis of the widget and fallback to the opposite axis if
/// the tooltip does cannot fit its content.
class MyTooltip extends StatefulWidget {
  const MyTooltip({
    super.key,
    this.alignment = Alignment.topCenter,
    this.duration,
    this.transitionDuration = const Duration(milliseconds: 150),
    this.transitionBuilder = defaultTransitionBuilder,
    this.reverseTransitionDuration = const Duration(milliseconds: 75),
    this.reverseTransitionBuilder = defaultReverseTransitionBuilder,
    this.direction = AxisDirection.up,
    this.margin = const EdgeInsets.all(8.0),
    this.position = 0.0,
    this.elevation = 4.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.tailLength = 16.0,
    this.tailBaseWidth = 32.0,
    this.tailBuilder = defaultTailBuilder,
    this.backgroundColor,
    this.textDirection = TextDirection.ltr,
    this.shadow,
    required this.content,
    required this.child,
  });

  final Alignment alignment;

  final AxisDirection direction;

  /// The duration before dismissing the tooltip.
  /// Set this to `null` to disable auto-dismiss.
  final Duration? duration;

  final Duration transitionDuration;

  final AnimatedTransitionBuilder transitionBuilder;

  final Duration reverseTransitionDuration;

  final AnimatedTransitionBuilder reverseTransitionBuilder;

  final EdgeInsetsGeometry margin;

  /// {@template my_tooltip.MyTooltip.position}
  /// The position of [content] along the tail's axis.
  /// It ranges from -1.0 to 1.0, where 0.0 is the center.
  ///
  /// When [direction] is vertical, the greater [position] value is,
  /// the more [content] is positioned to the right.
  ///
  /// When [direction] is horizontal, the greater [position] value is,
  /// the more [content] is positioned to the bottom.
  /// {@endtemplate}
  final double position;

  final double elevation;

  final BorderRadiusGeometry borderRadius;

  final double tailLength;

  final double tailBaseWidth;

  final TailBuilder tailBuilder;

  final Color? backgroundColor;

  final TextDirection textDirection;

  final Shadow? shadow;

  final Widget content;

  final Widget child;

  static Widget defaultTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Widget? child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static Widget defaultReverseTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Widget? child,
  ) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(animation),
      child: child,
    );
  }

  /// Draws a linear closed triangle path for the tail.
  static Path defaultTailBuilder(Offset tip, Offset point2, Offset point3) {
    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(point2.dx, point2.dy)
      ..lineTo(point3.dx, point3.dy)
      ..close();
  }

  /// Draws a bezier closed triangle path for the tail.
  static Path defaultBezierTailBuilder(
    Offset tip,
    Offset point2,
    Offset point3,
  ) {
    final offsetBetween = Offset(
      lerpDouble(point2.dx, point3.dx, 0.5)!,
      lerpDouble(point2.dy, point3.dy, 0.5)!,
    );

    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..quadraticBezierTo(
        offsetBetween.dx,
        offsetBetween.dy,
        point2.dx,
        point2.dy,
      )
      ..lineTo(point3.dx, point3.dy)
      ..quadraticBezierTo(
        offsetBetween.dx,
        offsetBetween.dy,
        tip.dx,
        tip.dy,
      )
      ..close();
  }

  @override
  MyTooltipState createState() => MyTooltipState();
}

class MyTooltipState extends State<MyTooltip>
    with SingleTickerProviderStateMixin<MyTooltip> {
  OverlayEntry? _overlayEntry;
  bool get _hasEntry => _overlayEntry != null;

  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.transitionDuration,
      reverseDuration: widget.reverseTransitionDuration,
    )..addStatusListener(_handleStatusChanged);
  }

  @override
  void dispose() {
    _stopDismissTimer();
    _animationController?.dispose();
    _animationController = null;
    _removeOverlayEntry();
    super.dispose();
  }

  void _removeOverlayEntry() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      _removeOverlayEntry();
      _stopDismissTimer();
    }
  }

  bool get isShowing => _hasEntry;

  Future<void> showTooltip() async {
    if (isShowing) return;
    _createOverlayEntry();
    await _animationController?.forward();
    _startDismissTimer();
  }

  Future<void> updateTooltip() async {
    await _animationController?.forward();
    _stopDismissTimer();
    await _scheduleUpdateOverlayEntry();
    _startDismissTimer();
  }

  Timer? _dismissTimer;
  bool get _isAutoDismiss => widget.duration != null;

  void _startDismissTimer() {
    if (!mounted || !_isAutoDismiss) return;
    _dismissTimer = Timer(widget.duration!, hideTooltip);
  }

  void _stopDismissTimer() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
  }

  Future<void> hideTooltip() async {
    await _animationController?.reverse();
  }

  @override
  void deactivate() {
    if (_hasEntry) {
      _removeOverlayEntry();
    }
    super.deactivate();
  }

  final GlobalKey _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    assert(Overlay.of(context, debugRequiredFor: widget) != null);
    return KeyedSubtree(
      key: _childKey,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant MyTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_shouldUpdateTooltipOverlay(oldWidget)) {
      _scheduleUpdateOverlayEntry();
    }
  }

  bool _shouldUpdateTooltipOverlay(MyTooltip oldWidget) {
    return oldWidget.alignment != widget.alignment ||
        oldWidget.backgroundColor != widget.backgroundColor ||
        oldWidget.borderRadius != widget.borderRadius ||
        oldWidget.direction != widget.direction ||
        oldWidget.elevation != widget.elevation ||
        oldWidget.margin != widget.margin ||
        oldWidget.position != widget.position ||
        oldWidget.shadow != widget.shadow ||
        oldWidget.tailBaseWidth != widget.tailBaseWidth ||
        oldWidget.tailLength != widget.tailLength ||
        oldWidget.textDirection != widget.textDirection;
  }

  Future<void> _scheduleUpdateOverlayEntry() {
    final Completer<void> completer = Completer<void>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final OverlayEntry? overlayEntry = _overlayEntry;
      if (!mounted || overlayEntry == null || !overlayEntry.mounted) {
        completer.complete();
        return;
      }
      overlayEntry.markNeedsBuild();
      completer.complete();
    });
    return completer.future;
  }

  void _createOverlayEntry() {
    final OverlayState? overlay = Overlay.of(context);
    if (overlay == null) {
      throw StateError('Cannot find the overlay above this widget');
    }

    final OverlayEntry entry = OverlayEntry(builder: _buildEntry);
    _overlayEntry = entry;
    overlay.insert(entry);
  }

  static Rect _getRectFromContext(BuildContext context) {
    assert(!context.debugDoingBuild);
    assert(!(context as Element).debugIsDefunct);
    final RenderObject? renderBox = context.findRenderObject();
    if (renderBox is! RenderBox) {
      assert(false, 'The target context is not a RenderBox');
      return Rect.zero;
    }
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    return offset & size;
  }

  Widget _buildEntry(BuildContext context) {
    final Rect rect = _getRectFromContext(_childKey.currentContext!);
    final ThemeData theme = Theme.of(context);
    final Shadow defaultShadow = Shadow(
      offset: Offset.zero,
      blurRadius: 0.0,
      color: theme.shadowColor,
    );

    final Material content = Material(
      type: MaterialType.transparency,
      child: widget.content,
    );

    return DualTransitionBuilder(
      animation: _animationController!.view,
      forwardBuilder: widget.transitionBuilder,
      reverseBuilder: widget.reverseTransitionBuilder,
      child: Directionality(
        textDirection: widget.textDirection,
        child: SimpleTooltip(
          rect: rect,
          alignment: widget.alignment,
          direction: widget.direction,
          margin: widget.margin,
          position: widget.position,
          borderRadius: widget.borderRadius,
          tailBaseWidth: widget.tailBaseWidth,
          tailLength: widget.tailLength,
          tailBuilder: widget.tailBuilder,
          backgroundColor: widget.backgroundColor ?? theme.cardColor,
          textDirection: widget.textDirection,
          shadow: widget.shadow ?? defaultShadow,
          elevation: widget.elevation,
          child: content,
        ),
      ),
    );
  }
}
