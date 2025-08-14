import 'package:flutter/material.dart';

/// Defines the main application layout including AppBar and actions.
class TodoAppLayout extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const TodoAppLayout({super.key, required this.title, required this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // TODO: Implement search logic (e.g., show a search bar)
          },
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            // TODO: Implement logic for menu item selection
            print('Selected: $value');
          },
          itemBuilder: (BuildContext context) {
            return {'Filter', 'Sort by Date', 'Clear All'}.map((String choice) {
              return PopupMenuItem<String>(value: choice, child: Text(choice));
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
