import 'package:flutter/material.dart';

class CustomTabBar extends SliverPersistentHeaderDelegate {
  const CustomTabBar();


  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {

    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: const TabBar(
          labelColor: Colors.black87,
          indicatorColor: Colors.green,
          isScrollable: true,
          physics: BouncingScrollPhysics(),
          enableFeedback: true,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              //icon: Icon(Icons.info),
              text: 'Описание',

            ),
            Tab(
              //icon: Icon(Icons.lightbulb_outline),
                text: "Маршрут"),
            Tab(
              //icon: Icon(Icons.lightbulb_outline),
                text: "Включено"),
            Tab(
              //icon: Icon(Icons.lightbulb_outline),
                text: "Не в стоимости")
          ]
      ),
    );
  }
}
