import 'package:edusparkv4/core/widgets/widgets/custom_list_views.dart';
import 'package:flutter/material.dart';

class MyItem {
  final String id;
  final String title;

  MyItem(this.id, this.title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  late final List<MyItem> _initialItems;
  late final List<StaggeredGridItemData> staggaredItems;
  @override
  void initState() {
    super.initState();
    _initialItems = List.generate(10, (index) => MyItem(index.toString(), 'Item ${index + 1}'));
    staggaredItems = List.generate(
      10,
      (index) => StaggeredGridItemData(widget: ListTile(title: Text("Item $index"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomListView<MyItem>(
          initialItems: _initialItems,
          key: const ValueKey('item.id'),
          itemBuilder: (context, item) => Card(
            key: ValueKey(item.id),
            child: ListTile(title: Text(item.title), subtitle: Text('ID: ${item.id}')),
          ),
        ),
      ),
    );
  }
}

// CustomReorderableListView<MyItem>(
//                   initialItems: initialItems,
//                   key: ValueKey('item.id') ,
//                   itemBuilder: (context, item) => Card(
//                     key: ValueKey(item.id),
//                     child: ListTile(
//                       title: Text(item.title),
//                       subtitle: Text('ID: ${item.id}'),
//                     ),
//                   ),)
// CustomGridView<MyItem>(
//                   initialItems: initialItems,
//                   crossAxisCount: 3,
//                   itemBuilder: (context, item) => Card(
//                     child: Center(child: Text(item.title)),
//                   ),
//                 ),
// CustomListView<MyItem>(
//         initialItems: initialItems,
//         itemBuilder: (context, item) => Card(
//           child: ListTile(
//             title: Text(item.title),
//             subtitle: Text('ID: ${item.id}'),
//           ),
//         ),
//       ),
// Scaffold(
//       appBar: AppBar(title: const Text('Custom List Examples')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Custom ListView',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(
//                 height: 200,
//                 child: CustomListView<MyItem>(
//                   initialItems: initialItems,
//                   itemBuilder: (context, item) => Card(
//                     child: ListTile(
//                       title: Text(item.title),
//                       subtitle: Text('ID: ${item.id}'),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text('Custom GridView',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(
//                 height: 200,
//                 child: 
//               ),
//               const SizedBox(height: 20),
//               const Text('Custom Reorderable ListView',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(
//                 height: 200,
//                 child:
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text('Custom Reorderable GridView',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(
//                 height: 200,
//                 child: 
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
