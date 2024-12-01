import 'dart:async';

import 'package:flutter/material.dart';

mixin LoadMoreMixin<S extends StatefulWidget> on State<S> {
  double get loadMoreThreshold => 200;

  ScrollController? get scrollController;

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      scrollController?.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final controller = scrollController;
    if (controller == null || controller.hasClients == false) return;

    final thresholdReached =
        controller.position.extentAfter < loadMoreThreshold;

    if (thresholdReached) {
      onLoadMoreThresholdReached();
    }
  }

  void onLoadMoreThresholdReached();
}
