// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

import 'package:expansion_tile_group/expansion_tile_group.dart';

class CustomExpansionTileCard extends StatefulWidget {
  const CustomExpansionTileCard({
    super.key,
    required this.title,
    required this.children,
  });

  final Widget title;
  final List<Widget> children;

  @override
  State<CustomExpansionTileCard> createState() =>
      _CustomExpansionTileCardState();
}

class _CustomExpansionTileCardState extends State<CustomExpansionTileCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ExpansionTileCustomState> _key =
      GlobalKey<ExpansionTileCustomState>();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 0.5)
        .animate(_controller); // Rotating 180 degrees
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExpansionTileItem(
                  onExpansionChanged: (value) =>
                      value ? _controller.forward() : _controller.reverse(),
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  isDefaultVerticalPadding: false,
                  title: SizedBox(
                    width: constraints.maxWidth,
                    child: widget.title,
                  ),
                  expansionKey: _key,
                  isHasTrailing: false,
                  children: widget.children,
                ),
                SizedBox(
                  width: constraints.maxWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_key.currentState != null) {
                        _key.currentState!.toggle();
                        if (_controller.isCompleted) {
                          _controller.reverse();
                        } else {
                          _controller.forward();
                        }
                      }
                    },
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animation.value * 3.1415927 * 2,
                          child: child,
                        );
                      },
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
