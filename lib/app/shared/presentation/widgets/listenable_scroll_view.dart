import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ScrollCallback = bool Function(
    AxisDirection direction, ScrollNotification notification);

///? A scrollview that emits events.
class ListenableScrollView extends StatefulWidget {
  const ListenableScrollView({
    Key? key,
    this.onScroll,
    required this.slivers,
  }) : super(key: key);

  final ScrollCallback? onScroll;
  final List<Widget> slivers;

  @override
  State<ListenableScrollView> createState() => _ListenableScrollViewState();
}

class _ListenableScrollViewState extends State<ListenableScrollView> {
  late final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: widget.slivers,
      ),
      onNotification: _onNotification,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  bool _onNotification(ScrollNotification notification) {
    if (widget.onScroll != null) {
      var direction = _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse
          ? AxisDirection.down
          : AxisDirection.up;

      return widget.onScroll!(direction, notification);
    }
    return true;
  }
}
