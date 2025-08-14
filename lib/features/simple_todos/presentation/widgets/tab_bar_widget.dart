import 'package:flutter/material.dart';

/// A reusable tab bar widget for filtering views.
class TabBarWidget extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;

  const TabBarWidget({super.key, required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs.map((String name) => Tab(text: name)).toList(),
      onTap: (index) {
        // TODO: Implement logic to filter the list based on the selected tab
      },
    );
  }
}
