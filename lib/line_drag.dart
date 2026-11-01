// Horizontal dragging of a display line that does not fit its display.

import 'package:flutter/gestures.dart';

/// A horizontal drag that only enters the gesture arena where [allowedAt] says
/// so: only a line that overflows can be dragged.
class LineDragRecognizer extends HorizontalDragGestureRecognizer {
  LineDragRecognizer({required this.allowedAt});

  bool Function(Offset local) allowedAt;

  @override
  bool isPointerAllowed(PointerEvent event) =>
      allowedAt(event.localPosition) && super.isPointerAllowed(event);
}
