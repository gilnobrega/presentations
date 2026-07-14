class _FixedStretchingOverscrollIndicator extends StatelessWidget{
  (...)
}

class _FixedStretchController extends ChangeNotifier
{
  (...)
    void absorbImpact(double velocity, double totalOverscroll) {
      (...)
      _stretchController.duration = Duration(
+     milliseconds: math.max(velocity * 0.02, 50).round(),
      );
      (...)
    }
  (...)
}

class FixedScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context, 
    Widget child, 
    ScrollableDetails details
  ) {
    return _FixedStretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }
}
