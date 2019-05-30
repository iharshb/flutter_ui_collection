import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

class VisibleWidget extends StatelessWidget {
  final VisibilityFlag visibility;
  final Widget child;
  final Widget removedChild;

  VisibleWidget({
    @required this.child,
    @required this.visibility,
  }) : this.removedChild = Container();

  @override
  Widget build(BuildContext context) {
    if (visibility == VisibilityFlag.visible) {
      return child;
    } else if (visibility == VisibilityFlag.invisible) {
      return new IgnorePointer(
        ignoring: true,
        child: new Opacity(
          opacity: 0.0,
          child: child,
        ),
      );
    } else if (visibility == VisibilityFlag.offscreen) {
      return new Offstage(
        offstage: true,
        child: child,
      );
    } else {
      // If gone, we replace child with a custom widget (defaulting to a
      // [Container] with no defined size).
      return removedChild;
    }
  }
}