import 'dart:convert';

import 'package:demo_pass_data/data/data.dart';
import 'package:demo_pass_data/model/grocery_Item.dart';
import 'package:demo_pass_data/widget/new_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GrocetyList extends StatefulWidget {
  const GrocetyList({super.key});

  @override
  State<GrocetyList> createState() => _GrocetyListState();
}

class _GrocetyListState extends State<GrocetyList> {
  List<GroceryItem> _groceryItem = [];
  // tạo _groceryItem để thêm dữ liệu vào màn hình
  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    final url = Uri.https(
        'fir-app-shopping-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    //dùng http.get để lấy giữ liệu từ firebase về
    final Map<String, dynamic> listData = json.decode(response.body);
    // tạo listdata
    final List<GroceryItem> loadItems = [];
    // tạo 1 list  _loadItems trống
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['soLuong'],
          category: category));

    } // dùng for in để duyệt qua phần tử trong listdata, dùng firstWhere để tìm phần tử đầu tiên,

    setState(() {
      _groceryItem = loadItems;
    });
  }
  // add giữ liệu từ firebase trả màn hình về sau khi dc mã hóa

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    _loadItem(); 
    // if (newItem == null) {
    //   return;
    // }
    // setState(() {
    //   _groceryItem.add(newItem);
    // });
    //thêm 1 id mới vào danh sách
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
      child: Text("Chưa có sản phẩm nào được thêm "),
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
                 
                  title: Text(
                    _groceryItem[index].name.toUpperCase(),
                  ),
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
        centerTitle: true,
      ),
      body: content,
    );
  }
}
