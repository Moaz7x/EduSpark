import 'package:edusparkv4/core/widgets/providers/custom_list_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

class CustomListView<T> extends ConsumerWidget {
  final List<T> initialItems;
  final Widget Function(BuildContext context, T item) itemBuilder;

  const CustomListView({super.key, required this.initialItems, required this.itemBuilder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(customListProvider<T>(initialItems));

    if (listState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (listState.error != null) {
      return Center(child: Text('Error: ${listState.error}'));
    }

    return ListView.builder(
      itemCount: listState.items.length,
      itemBuilder: (BuildContext context, int index) {
        return itemBuilder(context, listState.items[index]);
      },
    );
  }
}

class CustomGridView<T> extends ConsumerWidget {
  final List<T> initialItems;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final int crossAxisCount;

  const CustomGridView({
    super.key,
    required this.initialItems,
    required this.itemBuilder,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(customListProvider(initialItems));

    if (listState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (listState.error != null) {
      return Center(child: Text('Error: ${listState.error}'));
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: listState.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = listState.items[index];
        return itemBuilder(context, item);
      },
    );
  }
}

class CustomReorderableListView<T> extends ConsumerWidget {
  final List<T> initialItems;
  final Widget Function(BuildContext context, T item) itemBuilder;

  const CustomReorderableListView({
    super.key,
    required this.initialItems,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(reorderableListProvider<T>(initialItems));
    if (listState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (listState.error != null) {
      return Center(child: Text('Error: ${listState.error}'));
    }

    return ReorderableListView.builder(
      itemCount: listState.items.length,
      itemBuilder: (BuildContext context, int index) =>
          itemBuilder(context, listState.items[index]),
      onReorder: (int oldIndex, int newIndex) {
        ref
            .read(reorderableListProvider<T>(initialItems).notifier)
            .reorderItems(oldIndex, newIndex);
      },
    );
  }
}

class CustomReorderableGridView<T> extends ConsumerWidget {
  final List<T> initialItems;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final int crossAxisCount;

  const CustomReorderableGridView({
    super.key,
    required this.initialItems,
    required this.itemBuilder,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(reorderableListProvider<T>(initialItems));
    if (listState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (listState.error != null) {
      return Center(child: Text('Error: ${listState.error}'));
    }

    return ReorderableGridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: listState.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = listState.items[index];
        return itemBuilder(context, item);
      },
      onReorder: (int oldIndex, int newIndex) {
        ref
            .read(reorderableListProvider<T>(initialItems).notifier)
            .reorderItems(oldIndex, newIndex);
      },
    );
  }
}

class StaggeredGridItemData {
  final Widget widget;
  final int? mainAxisCellCount;
  final int? crossAxisCellCount;

  StaggeredGridItemData({required this.widget, this.mainAxisCellCount, this.crossAxisCellCount});
}

// class CustomReorderableStaggeredGridView extends ConsumerWidget {
//   final List<StaggeredGridItemData> initialItems;
//   final Widget Function(BuildContext context, StaggeredGridItemData item) itemBuilder;
//   final int crossAxisCount;

//   const CustomReorderableStaggeredGridView({
//     super.key,
//     required this.initialItems,
//     required this.itemBuilder,
//     this.crossAxisCount = 2,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final listState = ref.watch(reorderableListProvider<StaggeredGridItemData>(initialItems));
//     if (listState.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (listState.error != null) {
//       return Center(child: Text('Error: ${listState.error}'));
//     }

//     return ReorderableStaggeredScrollView.grid(
//       enable: true,
//       padding: const EdgeInsets.all(16),
//       scrollDirection: Axis.vertical,
//       physics: const BouncingScrollPhysics(),
//       crossAxisCount: crossAxisCount,
//       isLongPressDraggable: true,
//       onAccept:
//           (
//             ReorderableStaggeredScrollViewGridItem? acceptedItem,
//             ReorderableStaggeredScrollViewGridItem targetItem,
//             bool val,
//           ) {
//             final oldIndex = listState.items.indexOf(
//               listState.items.firstWhere(
//                 (item) => item.hashCode == (acceptedItem?.key as ValueKey).value,
//                 orElse: () => listState.items.first,
//               ),
//             );
//             final newIndex = listState.items.indexOf(
//               listState.items.firstWhere(
//                 (item) => item.hashCode == (targetItem.key as ValueKey).value,
//                 orElse: () => listState.items.first,
//               ),
//             );
//             if (oldIndex != -1 && newIndex != -1) {
//               ref
//                   .read(reorderableListProvider<StaggeredGridItemData>(initialItems).notifier)
//                   .reorderItems(oldIndex, newIndex);
//             }
//           },
//       onWillAccept:
//           (
//             ReorderableStaggeredScrollViewGridItem? acceptedItem,
//             ReorderableStaggeredScrollViewGridItem targetItem,
//             bool val,
//           ) {
//             // Only accept if there is an item being dragged and it's different from the target
//             if (acceptedItem == null) return false;

//             // Prevent dropping item onto itself
//             if (acceptedItem.key == targetItem.key) return false;

//             // Additional validation could be added here if needed
//             return true;
//           },
//       onLeave:
//           (
//             ReorderableStaggeredScrollViewGridItem? acceptedItem,
//             ReorderableStaggeredScrollViewGridItem targetItem,
//             bool val,
//           ) {
//             // Handle when dragged item leaves a target
//             debugPrint('Item ${acceptedItem?.key} left target ${targetItem.key}');
//           },
//       onMove:
//           (
//             ReorderableStaggeredScrollViewGridItem item,
//             DragTargetDetails<ReorderableStaggeredScrollViewGridItem> details,
//             bool val,
//           ) {
//             // Handle item movement during drag
//             final offset = details.offset;
//             debugPrint('Item ${item.key} moved to position: $offset');
//           },
//       onDragStarted: (ReorderableStaggeredScrollViewGridItem item) {
//         debugPrint('Started dragging item ${item.key}');
//       },
//       onDragUpdate: (DragUpdateDetails details, ReorderableStaggeredScrollViewGridItem item) {
//         debugPrint('Dragging item ${item.key} - Delta: ${details.delta}');
//       },
//       onDraggableCanceled:
//           (Velocity velocity, Offset offset, ReorderableStaggeredScrollViewGridItem item) {
//             debugPrint('Drag canceled for item ${item.key} at offset $offset');
//           },
//       onDragEnd: (DraggableDetails details, ReorderableStaggeredScrollViewGridItem item) {
//         debugPrint('Drag ended for item ${item.key} at ${details.offset}');
//       },
//       onDragCompleted: (ReorderableStaggeredScrollViewGridItem item) {
//         debugPrint('Drag completed for item ${item.key}');
//       },
//       scrollController: ScrollController(),
//       children: listState.items.map((item) {
//         return ReorderableStaggeredScrollViewGridItem(
//           key: ValueKey(item.hashCode),

//           widget: itemBuilder(context, item),
//         );
//       }).toList(),
//     );
//   }
// }

// You can add more specialized list/grid views here as needed.
// For example, a paginated list view, or a searchable list view.
