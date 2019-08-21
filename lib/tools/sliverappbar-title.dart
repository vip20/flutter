import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/utils/uidata.dart';

class SliverAppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;
    double animationVal = ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
    // debugPrint(animationVal.toString());
    return animationVal;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final double animationVal = scrollAnimationValue(shrinkOffset);
    final double textBottomPosition =
        max((animationVal * 100).toDouble() * 0.8, 10.0 * 0.8) *
            UIData.bottomOffsetTitle;
    final bool isSmallWidth = animationVal > 0.15 ? true : false;
    final double textWidth = MediaQuery.of(context).size.width;
    return Container(
      height: visibleMainHeight,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedOpacity(
              duration: Duration(milliseconds: 50),
              opacity: 1 - animationVal,
              child: Container(
                color: Colors.black,
              )),
          Positioned(
            bottom: textBottomPosition,
            left: 10.0,
            child: SizedBox(
              width: textWidth,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: new Text(UIData.appName,
                        style: TextStyle(fontSize: 30.0, color: Colors.white)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 270.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
