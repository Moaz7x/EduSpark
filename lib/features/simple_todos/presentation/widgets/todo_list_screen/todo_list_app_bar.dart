import 'package:flutter/material.dart';

class TodoListAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onSearchChanged;

  const TodoListAppBar({super.key, required this.onSearchChanged});

  @override
  State<TodoListAppBar> createState() => _TodoListAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TodoListAppBarState extends State<TodoListAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      widget.onSearchChanged(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search todos...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white54),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          : const Text('My Todos'),
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: _toggleSearch,
        ),
        if (!_isSearching)
          PopupMenuButton<String>(
            onSelected: (value) {
              // TODO: Implement logic for menu item selection
            },
            itemBuilder: (BuildContext context) {
              return {'Filter', 'Sort by Date', 'Clear All'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
      ],
    );
  }
}
