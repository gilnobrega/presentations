// lib/scroll_behavior.dart
class FixedScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context, 
    Widget child, 
    ScrollableDetails details
  ) {
    return FixedStretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }
}
