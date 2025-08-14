import 'package:edusparkv4/core/widgets/notifiers/paginated_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

class CustomHybridListView<T> extends ConsumerStatefulWidget {
  final List<T> initialItems;
  final Widget Function(BuildContext context, T item, Key key) itemBuilder;
  final Future<List<T>> Function(int page) fetchPage;
  final int crossAxisCount;
  final ScrollController? scrollController;

  const CustomHybridListView({
    super.key,
    required this.initialItems,
    required this.itemBuilder,
    required this.fetchPage,
    this.crossAxisCount = 2,
    this.scrollController,
  });

  @override
  ConsumerState<CustomHybridListView<T>> createState() => _CustomHybridListViewState<T>();
}

class _CustomHybridListViewState<T> extends ConsumerState<CustomHybridListView<T>>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
    // Initial load if items are empty
    if (widget.initialItems.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(paginatedListProvider(widget.initialItems).notifier)
            .loadMoreItems(widget.fetchPage);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      ref.read(paginatedListProvider(widget.initialItems).notifier).loadMoreItems(widget.fetchPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final listState = ref.watch(paginatedListProvider(widget.initialItems));

    if (listState.isLoading && listState.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (listState.error != null && listState.items.isEmpty) {
      return Center(child: Text('Error: ${listState.error}'));
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverReorderableGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            mainAxisSpacing: 8.0,
            mainAxisExtent: 8.0,
          ),
          itemCount: listState.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = listState.items[index];
            return widget.itemBuilder(
              context,
              item,
              ValueKey(item.hashCode),
            ); // Using ValueKey for simplicity, user can provide custom keys
          },
          onReorder: (int oldIndex, int newIndex) {
            ref
                .read(paginatedListProvider(widget.initialItems).notifier)
                .reorderItems(oldIndex, newIndex);
          },
        ),
        if (listState.isLoading && listState.items.isNotEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        if (listState.error != null && listState.items.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Error loading more: ${listState.error}')),
            ),
          ),
        if (!listState.hasMore && listState.items.isNotEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('No more items to load.')),
            ),
          ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
