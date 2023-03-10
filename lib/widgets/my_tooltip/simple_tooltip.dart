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

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef TailBuilder = Path Function(
  Offset point1,
  Offset point2,
  Offset point3,
);

class SimpleTooltip extends SingleChildRenderObjectWidget {
  const SimpleTooltip({
    super.key,
    required this.rect,
    required this.alignment,
    required this.direction,
    required this.margin,
    required this.position,
    required this.borderRadius,
    required this.tailLength,
    required this.tailBaseWidth,
    required this.tailBuilder,
    required this.textDirection,
    required this.backgroundColor,
    required this.shadow,
    required this.elevation,
    super.child,
  });

  final Rect rect;
  final Alignment alignment;
  final AxisDirection direction;
  final EdgeInsetsGeometry margin;
  final double position;
  final BorderRadiusGeometry borderRadius;
  final double tailLength;
  final double tailBaseWidth;
  final TailBuilder tailBuilder;
  final TextDirection textDirection;
  final Color backgroundColor;
  final Shadow shadow;
  final double elevation;

  @override
  RenderSimpleTooltip createRenderObject(BuildContext context) {
    return RenderSimpleTooltip(
      rect: rect,
      alignment: alignment,
      direction: direction,
      margin: margin,
      position: position,
      borderRadius: borderRadius,
      tailLength: tailLength,
      tailBaseWidth: tailBaseWidth,
      tailBuilder: tailBuilder,
      textDirection: textDirection,
      backgroundColor: backgroundColor,
      shadow: shadow,
      elevation: elevation,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSimpleTooltip renderObject,
  ) {
    renderObject
      ..rect = rect
      ..alignment = alignment
      ..direction = direction
      ..margin = margin
      ..position = position
      ..borderRadius = borderRadius
      ..tailLength = tailLength
      ..tailBaseWidth = tailBaseWidth
      ..tailBuilder = tailBuilder
      ..textDirection = textDirection
      ..backgroundColor = backgroundColor
      ..shadow = shadow
      ..elevation = elevation;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Rect>('rect', rect));
    properties.add(DiagnosticsProperty<Alignment>('alignment', alignment));
    properties.add(DiagnosticsProperty<AxisDirection>('direction', direction));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin));
    properties.add(DoubleProperty('position', position));
    properties.add(
      DiagnosticsProperty<BorderRadiusGeometry>('borderRadius', borderRadius),
    );
    properties.add(DoubleProperty('tailLength', tailLength));
    properties.add(DoubleProperty('tailBaseWidth', tailBaseWidth));
    properties.add(ObjectFlagProperty<TailBuilder>.has(
      'tailBuilder',
      tailBuilder,
    ));
    properties.add(
      DiagnosticsProperty<TextDirection>('textDirection', textDirection),
    );
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(DiagnosticsProperty<Shadow>('shadow', shadow));
    properties.add(DoubleProperty('elevation', elevation));
  }
}

class RenderSimpleTooltip extends RenderShiftedBox {
  RenderSimpleTooltip({
    required Alignment alignment,
    required Rect rect,
    required AxisDirection direction,
    required EdgeInsetsGeometry margin,
    required double position,
    required BorderRadiusGeometry borderRadius,
    required double tailLength,
    required double tailBaseWidth,
    required TailBuilder tailBuilder,
    required TextDirection textDirection,
    required Color backgroundColor,
    required Shadow shadow,
    required double elevation,
    RenderBox? child,
  })  : _alignment = alignment,
        _rect = rect,
        _direction = direction,
        _margin = margin,
        _position = position,
        _borderRadius = borderRadius,
        _tailLength = tailLength,
        _tailBaseWidth = tailBaseWidth,
        _tailBuilder = tailBuilder,
        _textDirection = textDirection,
        _backgroundColor = backgroundColor,
        _shadow = shadow,
        _elevation = elevation,
        super(child);

  Alignment _alignment;
  Alignment get alignment => _alignment;
  set alignment(Alignment value) {
    if (value == _alignment) return;
    _alignment = value;
    markNeedsLayout();
  }

  Rect _rect;
  Rect get rect => _rect;
  set rect(Rect value) {
    if (value == _rect) return;
    _rect = value;
    markNeedsLayout();
  }

  AxisDirection get direction => _direction;
  AxisDirection _direction;
  set direction(AxisDirection value) {
    if (_direction == value) return;
    _direction = value;
    markNeedsLayout();
  }

  EdgeInsetsGeometry get margin => _margin;
  EdgeInsetsGeometry _margin;
  set margin(EdgeInsetsGeometry value) {
    if (_margin == value) return;
    _margin = value;
    markNeedsLayout();
  }

  double get position => _position;
  double _position;
  set position(double value) {
    if (_position == value) return;
    _position = value;
    markNeedsLayout();
  }

  BorderRadiusGeometry get borderRadius => _borderRadius;
  BorderRadiusGeometry _borderRadius;
  set borderRadius(BorderRadiusGeometry value) {
    if (_borderRadius == value) return;
    _borderRadius = value;
    markNeedsLayout();
  }

  double get tailLength => _tailLength;
  double _tailLength;
  set tailLength(double value) {
    if (_tailLength == value) return;
    _tailLength = value;
    markNeedsLayout();
  }

  double get tailBaseWidth => _tailBaseWidth;
  double _tailBaseWidth;
  set tailBaseWidth(double value) {
    if (_tailBaseWidth == value) return;
    _tailBaseWidth = value;
    markNeedsLayout();
  }

  TailBuilder get tailBuilder => _tailBuilder;
  TailBuilder _tailBuilder;
  set tailBuilder(TailBuilder value) {
    if (_tailBuilder == value) return;
    _tailBuilder = value;
    markNeedsLayout();
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor;
  set backgroundColor(Color value) {
    if (_backgroundColor == value) return;
    _backgroundColor = value;
    markNeedsPaint();
  }

  Shadow get shadow => _shadow;
  Shadow _shadow;
  set shadow(Shadow value) {
    if (_shadow == value) return;
    _shadow = value;
    markNeedsPaint();
  }

  double get elevation => _elevation;
  double _elevation;
  set elevation(double value) {
    if (_elevation == value) return;
    _elevation = value;
    markNeedsPaint();
  }

  double get _tailMargin {
    final EdgeInsets resolvedMargin = margin.resolve(textDirection);
    switch (direction) {
      case AxisDirection.up:
        return resolvedMargin.bottom;
      case AxisDirection.down:
        return resolvedMargin.top;
      case AxisDirection.right:
        return resolvedMargin.left;
      case AxisDirection.left:
        return resolvedMargin.right;
    }
  }

  @pragma('vm:prefer-inline')
  static bool _shouldShrinkWrapWidth(BoxConstraints constraints) {
    return constraints.maxWidth == double.infinity;
  }

  @pragma('vm:prefer-inline')
  static bool _shouldShrinkWrapHeight(BoxConstraints constraints) {
    return constraints.maxHeight == double.infinity;
  }

  // Copied from [RenderPositionedBox.computeDryLayout]
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final bool shrinkWrapWidth = _shouldShrinkWrapWidth(constraints);
    final bool shrinkWrapHeight = _shouldShrinkWrapHeight(constraints);
    if (child != null) {
      final Size childSize = child!.getDryLayout(constraints.loosen());
      return constraints.constrain(Size(
        shrinkWrapWidth ? childSize.width : double.infinity,
        shrinkWrapHeight ? childSize.height : double.infinity,
      ));
    }
    return constraints.constrain(Size(
      shrinkWrapWidth ? 0.0 : double.infinity,
      shrinkWrapHeight ? 0.0 : double.infinity,
    ));
  }

  BoxConstraints _computeConstraints(BoxConstraints constraints) {
    final EdgeInsets resolvedMargin = margin.resolve(textDirection);
    final BoxConstraints loosenConstraints =
        constraints.loosen().deflate(resolvedMargin);
    switch (direction) {
      case AxisDirection.up:
      case AxisDirection.down:
        return loosenConstraints.copyWith(
          maxWidth: loosenConstraints.maxWidth,
          maxHeight: loosenConstraints.maxHeight - tailLength,
        );
      case AxisDirection.right:
      case AxisDirection.left:
        return loosenConstraints.copyWith(
          maxWidth: loosenConstraints.maxWidth - tailLength,
          maxHeight: loosenConstraints.maxHeight,
        );
    }
  }

  // Copied from [RenderPositionedBox.performLayout]
  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    final bool shrinkWrapWidth = _shouldShrinkWrapWidth(constraints);
    final bool shrinkWrapHeight = _shouldShrinkWrapHeight(constraints);

    if (child != null) {
      child!.layout(_computeConstraints(constraints), parentUsesSize: true);
      size = constraints.constrain(Size(
        shrinkWrapWidth ? child!.size.width : double.infinity,
        shrinkWrapHeight ? child!.size.height : double.infinity,
      ));
      _alignChild();
    } else {
      size = constraints.constrain(Size(
        shrinkWrapWidth ? 0.0 : double.infinity,
        shrinkWrapHeight ? 0.0 : double.infinity,
      ));
    }
  }

  void _alignChild() {
    assert(child != null);
    assert(!child!.debugNeedsLayout);
    assert(child!.hasSize);
    assert(hasSize);

    final Size childSize = child!.size;
    final Offset alignedOffset = _computeAlignedOffset(childSize: childSize);
    final Offset translatedAlignedOffset = _computeTranslatedAlignedOffset(
      alignedOffset: alignedOffset,
      childSize: childSize,
    );
    final Offset boundedAlignedOffset = _computeBoundedAlignedOffset(
      alignedOffset: translatedAlignedOffset,
      childSize: childSize,
    );

    final BoxParentData childParentData = child!.parentData! as BoxParentData;
    childParentData.offset = boundedAlignedOffset;
  }

  Offset _computeAlignedOffset({required Size childSize}) {
    final double childXOffset;
    final double childYOffset;
    final double additionalOffset = _tailMargin + tailLength;

    // Alignment Modifier:
    // dx = 0.5 x alignmentX x target width
    // dy = 0.5 x alignmentY x target height
    switch (direction) {
      // Offset:
      // dx = target center dx + (-0.5 x child width) + xAlignmentModifier
      // dy = target center dy + (-1.0 x child height) + yAlignmentModifier
      case AxisDirection.up:
      // Offset:
      // dx = target center dx + (-0.5 x child width) + xAlignmentModifier
      // child is already at the bottom, no need to calculate its height,
      // hence the 0.0 x child height
      // dy = target center dy + (0.0 x child height) + yAlignmentModifier
      case AxisDirection.down:
        final double childHeight = childSize.height;
        final double childYOffsetMultiplier =
            direction == AxisDirection.up ? -1.0 : 0.0;
        final double additionalYOffsetMultiplier =
            direction == AxisDirection.up ? -1.0 : 1.0;
        final double yAdditionalOffset =
            additionalYOffsetMultiplier * additionalOffset;
        childXOffset = -0.5 * childSize.width;
        childYOffset = childYOffsetMultiplier * childHeight + yAdditionalOffset;
        break;
      // Offset:
      // child is already at the right, no need to calculate its width,
      // hence the 0.0 x child width
      // dx = target center dx + (0.0 x child width) + xAlignmentModifier
      // dy = target center dy + (-0.5 x child height) + yAlignmentModifier
      case AxisDirection.right:
      // Offset:
      // dx = target center dx + (-1.0 x child width) + xAlignmentModifier
      // dy = target center dy + (-0.5 x child height) + yAlignmentModifier
      case AxisDirection.left:
        final double childWidth = childSize.width;
        final double childXOffsetMultiplier =
            direction == AxisDirection.right ? 0.0 : -1.0;
        final double additionalXOffsetMultiplier =
            direction == AxisDirection.right ? 1.0 : -1.0;
        final double xAdditionalOffset =
            additionalXOffsetMultiplier * additionalOffset;
        childXOffset = childXOffsetMultiplier * childWidth + xAdditionalOffset;
        childYOffset = -0.5 * childSize.height;
        break;
    }
    // x
    final double targetCenterDx = rect.center.dx;
    final double xAlignmentModifier = 0.5 * alignment.x * rect.size.width;
    final double dx = targetCenterDx + childXOffset + xAlignmentModifier;

    // y
    final double targetCenterDy = rect.center.dy;
    final double yAlignmentModifier = 0.5 * alignment.y * rect.size.height;
    final double dy = targetCenterDy + childYOffset + yAlignmentModifier;

    return Offset(dx, dy);
  }

  Offset _computeTranslatedAlignedOffset({
    required Offset alignedOffset,
    required Size childSize,
  }) {
    final double boundedTranslation = math.max(
      -1.0,
      math.min(1.0, position),
    );
    switch (direction) {
      case AxisDirection.up:
      case AxisDirection.down:
        final double maxTranslationX = 0.5 * childSize.width;
        return alignedOffset.translate(
          boundedTranslation * maxTranslationX,
          0.0,
        );
      case AxisDirection.right:
      case AxisDirection.left:
        final double maxTranslationY = 0.5 * childSize.height;
        return alignedOffset.translate(
          0.0,
          boundedTranslation * maxTranslationY,
        );
    }
  }

  Offset _computeBoundedAlignedOffset({
    required Offset alignedOffset,
    required Size childSize,
  }) {
    final EdgeInsets margin = this.margin.resolve(textDirection);
    final Size size = constraints.biggest;
    final double dx = math.max(
      margin.left,
      math.min(
        size.width - margin.right - childSize.width,
        alignedOffset.dx,
      ),
    );
    final double dy = math.max(
      margin.top,
      math.min(
        size.height - margin.bottom - childSize.height,
        alignedOffset.dy,
      ),
    );
    return Offset(dx, dy);
  }

  // Copied from [RenderPositionedTooltip.paint] in
  // https://github.com/Nolence/just_the_tooltip/blob/main/lib/src/positioned_tooltip.dart
  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: add debug paint for overflows

    final RenderBox? child = this.child;
    if (child == null) return;

    final BoxParentData childParentData = child.parentData! as BoxParentData;
    final Offset parentDataOffset = childParentData.offset;
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    final Path path = Path();
    final BorderRadius radius = borderRadius.resolve(textDirection);
    final Offset childOffset = offset + parentDataOffset;
    final Rect rect = childOffset & child.size;

    // TODO: Currently, I don't think this is triggered by an empty child. Dunno
    /// why this is the case or if this is a feature.
    if (!rect.isEmpty) {
      path
        ..addRRect(
          RRect.fromRectAndCorners(
            rect,
            topLeft: radius.topLeft,
            topRight: radius.topRight,
            bottomLeft: radius.bottomLeft,
            bottomRight: radius.bottomRight,
          ),
        )
        ..addPath(
          _paintTail(
            rect: rect,
            radius: radius,
          ),
          Offset.zero,
        );

      // TODO: What do I do about the blurSigma property on shadow?
      context.canvas.drawShadow(
        path.shift(shadow.offset),
        shadow.color,
        elevation,
        false,
      );
      context.canvas.drawPath(path, paint);
    }

    context.paintChild(child, childOffset);
  }

  Offset get _tailOffset {
    final double xAlignmentMultiplier = -0.5 * alignment.x;
    final double yAlignmentMultiplier = -0.5 * alignment.y;

    return Offset(
      rect.center.dx - xAlignmentMultiplier * rect.size.width,
      rect.center.dy - yAlignmentMultiplier * rect.size.height,
    );
  }

  // Copied from [RenderPositionedTooltip._paintTail] in
  // https://github.com/Nolence/just_the_tooltip/blob/main/lib/src/positioned_tooltip.dart
  Path _paintTail({
    required Rect rect,
    required BorderRadius radius,
  }) {
    // Clockwise around the triangle starting at the target center
    // point + offset
    double x = 0, y = 0, x2 = 0, y2 = 0, x3 = 0, y3 = 0;
    final Offset target = _tailOffset;

    switch (direction) {
      case AxisDirection.up:
        final double baseLength = math.min(
          tailBaseWidth,
          (rect.right - rect.left) -
              (radius.bottomLeft.x + radius.bottomRight.x),
        );
        final double halfBaseLength = baseLength / 2;
        final double insetLeftCorner = rect.left + radius.bottomLeft.x;
        final double insetRightCorner = rect.right - radius.bottomRight.x;

        if (insetLeftCorner > insetRightCorner) {
          // This happens when the content is so small, accounting for the
          // border radius messes up our measurements. Might as well not draw
          // a tail at this point
          break;
        }

        final Offset offsetTarget = target.translate(0, -_tailMargin);

        // assert(rect.bottom == _target.dy - tailLength);

        x = offsetTarget.dx;
        y = offsetTarget.dy;

        x2 = (math.min(offsetTarget.dx, insetRightCorner) - halfBaseLength)
            .clamp(insetLeftCorner, insetRightCorner);
        y2 = rect.bottom;

        x3 = (math.max(offsetTarget.dx, insetLeftCorner) + halfBaseLength)
            .clamp(insetLeftCorner, insetRightCorner);
        y3 = rect.bottom;
        break;
      case AxisDirection.down:
        final double baseLength = math.min(
          tailBaseWidth,
          (rect.right - rect.left) - (radius.topLeft.x + radius.topRight.x),
        );
        final double halfBaseLength = baseLength / 2;
        final double insetLeftCorner = rect.left + radius.topLeft.x;
        final double insetRightCorner = rect.right - radius.topRight.x;

        if (insetLeftCorner > insetRightCorner) break;

        final Offset offsetTarget = target.translate(0, _tailMargin);

        assert(rect.top == offsetTarget.dy + tailLength);

        x = offsetTarget.dx;
        y = offsetTarget.dy;

        x2 = (math.max(offsetTarget.dx, insetLeftCorner) + halfBaseLength)
            .clamp(insetLeftCorner, insetRightCorner);
        y2 = rect.top;

        x3 = (math.min(offsetTarget.dx, insetRightCorner) - halfBaseLength)
            .clamp(insetLeftCorner, insetRightCorner);
        y3 = rect.top;
        break;
      case AxisDirection.left:
        final double baseLength = math.min(
          tailBaseWidth,
          (rect.bottom - rect.top) - (radius.topRight.y + radius.bottomRight.y),
        );
        final double halfBaseLength = baseLength / 2;
        final double insetTopCorner = rect.top + radius.topRight.y;
        final double insetBottomCorner = rect.bottom - radius.bottomRight.y;

        if (insetBottomCorner < insetTopCorner) break;

        final Offset offsetTarget = target.translate(-_tailMargin, 0.0);

        assert(rect.right == offsetTarget.dx - tailLength);

        x = offsetTarget.dx;
        y = offsetTarget.dy;

        x2 = rect.right;
        y2 = (math.max(offsetTarget.dy, insetTopCorner) + halfBaseLength)
            .clamp(insetTopCorner, insetBottomCorner);

        x3 = rect.right;
        y3 = (math.min(offsetTarget.dy, insetBottomCorner) - halfBaseLength)
            .clamp(insetTopCorner, insetBottomCorner);

        break;
      case AxisDirection.right:
        final double baseLength = math.min(
          tailBaseWidth,
          (rect.bottom - rect.top) - (radius.topLeft.y + radius.topRight.y),
        );

        final double halfBaseLength = baseLength / 2;
        final double insetBottomCorner = rect.bottom - radius.bottomLeft.y;
        final double insetTopCorner = rect.top + radius.topLeft.y;

        if (insetBottomCorner < insetTopCorner) break;

        final Offset offsetTarget = target.translate(_tailMargin, 0.0);

        assert(rect.left == offsetTarget.dx + tailLength);

        x = offsetTarget.dx;
        y = offsetTarget.dy;

        x2 = rect.left;
        y2 = (math.min(offsetTarget.dy, insetBottomCorner) - halfBaseLength)
            .clamp(insetTopCorner, insetBottomCorner);

        x3 = rect.left;
        y3 = (math.max(offsetTarget.dy, insetTopCorner) + halfBaseLength)
            .clamp(insetTopCorner, insetBottomCorner);
        break;
    }

    return tailBuilder(Offset(x, y), Offset(x2, y2), Offset(x3, y3));
  }
}
