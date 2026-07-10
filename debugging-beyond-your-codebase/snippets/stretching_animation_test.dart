 testWidgets('Stretching animation completes after fling under scroll physics with high friction', (WidgetTester tester) async {
    // Regression test for https://github.com/flutter/flutter/issues/146277
    final GlobalKey box1Key = GlobalKey();
    final GlobalKey box2Key = GlobalKey();
    final GlobalKey box3Key = GlobalKey();
    late final OverscrollNotification overscrollNotification;
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(NotificationListener<OverscrollNotification>(
      child: buildTest(
        box1Key,
        box2Key,
        box3Key,
        controller,
        physics: const _HighFrictionClampingScrollPhysics(),
      ),
      onNotification: (OverscrollNotification notification) {
        overscrollNotification = notification;
        return false;
      },
    ));

    expect(find.byType(StretchingOverscrollIndicator), findsOneWidget);
    expect(find.byType(GlowingOverscrollIndicator), findsNothing);
    final RenderBox box1 = tester.renderObject(find.byKey(box1Key));
    final RenderBox box2 = tester.renderObject(find.byKey(box2Key));
    final RenderBox box3 = tester.renderObject(find.byKey(box3Key));

    expect(controller.offset, 0.0);
    expect(box1.localToGlobal(Offset.zero), Offset.zero);
    expect(box2.localToGlobal(Offset.zero), const Offset(0.0, 250.0));
    expect(box3.localToGlobal(Offset.zero), const Offset(0.0, 500.0));

    // We fling to the trailing edge and let it settle.
    await tester.fling(find.byType(CustomScrollView), const Offset(0.0, -50.0), 10000.0);
    await tester.pumpAndSettle();

    // We are now at the trailing edge
    expect(overscrollNotification.velocity, lessThan(25));
    expect(controller.offset, 150.0);
    expect(box1.localToGlobal(Offset.zero).dy, -150.0);
    expect(box2.localToGlobal(Offset.zero).dy, 100.0);
    expect(box3.localToGlobal(Offset.zero).dy, 350.0);
  });
}

final class _HighFrictionClampingScrollPhysics extends ScrollPhysics {
  const _HighFrictionClampingScrollPhysics({super.parent});

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _HighFrictionClampingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    return ClampingScrollSimulation(
      position: position.pixels,
      velocity: velocity,
      friction: 0.94,
      tolerance: tolerance,
    );
  }
}
