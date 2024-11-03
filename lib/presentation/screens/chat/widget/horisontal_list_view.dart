import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//needed for scroll in web
class HorizontalListView extends StatefulWidget {
  final List<Widget> children;

  const HorizontalListView({super.key, required this.children});
  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          _scrollController.jumpTo(
            _scrollController.offset + event.scrollDelta.dy / 2,
          );
        }
      },
      child: SizedBox(
        height: 50, // Height of the horizontal list view
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          children: widget.children,
        ),
      ),
    );
  }
}
