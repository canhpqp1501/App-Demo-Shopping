import 'package:demo_pass_data/model/grocery_Item.dart';
import 'package:demo_pass_data/widget/new_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrocetyList extends StatefulWidget {
  const GrocetyList({super.key});

  @override
  State<GrocetyList> createState() => _GrocetyListState();
}

class _GrocetyListState extends State<GrocetyList> {
  final List<GroceryItem> _groceryItem = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItem.add(newItem);
    });
  }

  void _removedItem(GroceryItem item) {
    setState(() {
      _groceryItem.remove(item);
    });
  }
  // xóa id của danh sách

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No items added yet"),
    );
    if (_groceryItem.isNotEmpty) {
      content = ListView.builder(
          // itemCount: groceryItems.length,
          itemCount: _groceryItem.length,
          itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItem[index].id),
                onDismissed: (direction) {
                  _removedItem(_groceryItem[index]);
                },
                child: ListTile(
                  title: Text(_groceryItem[index].name.toUpperCase()),
                  leading: Container(
                    width: 30,
                    height: 30,
                    color: _groceryItem[index].category.color,
                  ),
                  trailing: Text(
                    _groceryItem[index].quantity.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _addItem),
        ],
      ),
      body: content,
    );
  }
}
