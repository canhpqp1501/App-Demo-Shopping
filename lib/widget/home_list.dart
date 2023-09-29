import 'dart:convert';

import 'package:demo_pass_data/data/data.dart';
import 'package:demo_pass_data/model/grocery_Item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<GroceryItem> _groceryItem = [];
  var _isLoading = true;
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
      _isLoading = false;
    });
  }
  // add giữ liệu từ firebase trả màn hình về sau khi dc mã hóa

  void _removedItem(GroceryItem item) {
    final url = Uri.https('fir-app-shopping-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    http.delete(url);
    setState(() {
      _groceryItem.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("Chưa có sản phẩm nào được thêm "),
    );
    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
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
      body: WillPopScope(
        child: content,
        onWillPop: () async {
          return false;
        },
      ),
    );
  }
}
