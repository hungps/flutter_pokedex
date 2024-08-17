import 'package:flutter/material.dart';

mixin LoadMoreMixin<S extends StatefulWidget> on State<S> {
  double get loadMoreThreshold => 200;

  ScrollController get scrollController;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    final thresholdReached =
        scrollController.position.extentAfter < loadMoreThreshold;

    if (thresholdReached) {
      onLoadMoreThresholdReached();
    }
  }

  void onLoadMoreThresholdReached();
}
