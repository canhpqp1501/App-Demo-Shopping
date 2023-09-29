// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:demo_pass_data/widget/home_list.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:demo_pass_data/widget/new_item.dart';

class GrocetyList extends StatefulWidget {
  const GrocetyList({
    Key? key,
  }) : super(key: key);

  @override
  State<GrocetyList> createState() => _GrocetyListState();
}

class _GrocetyListState extends State<GrocetyList> {
  int _selePageIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Center(child: HomeList()),
    Center(child: NewItem()),
    Center(child: Text("likes")),
  ];
  // List<GroceryItem> _groceryItem = [];
  // var _isLoading = true;
  // // tạo _groceryItem để thêm dữ liệu vào màn hình
  // @override
  // void initState() {
  //   super.initState();
  //   _loadItem();
  // }

  // void _loadItem() async {
  //   final url = Uri.https(
  //       'fir-app-shopping-default-rtdb.firebaseio.com', 'shopping-list.json');
  //   final response = await http.get(url);
  //   //dùng http.get để lấy giữ liệu từ firebase về
  //   final Map<String, dynamic> listData = json.decode(response.body);
  //   // tạo listdata
  //   final List<GroceryItem> loadItems = [];
  //   // tạo 1 list  _loadItems trống
  //   for (final item in listData.entries) {
  //     final category = categories.entries
  //         .firstWhere(
  //             (catItem) => catItem.value.title == item.value['category'])
  //         .value;
  //     loadItems.add(GroceryItem(
  //         id: item.key,
  //         name: item.value['name'],
  //         quantity: item.value['soLuong'],
  //         category: category));
  //   } // dùng for in để duyệt qua phần tử trong listdata, dùng firstWhere để tìm phần tử đầu tiên,

  //   setState(() {
  //     _groceryItem = loadItems;
  //     _isLoading = false;
  //   });
  // }
  // // add giữ liệu từ firebase trả màn hình về sau khi dc mã hóa

  // void _addItem() async {
  //   await Navigator.of(context).push<GroceryItem>(
  //     MaterialPageRoute(
  //       builder: (ctx) => const NewItem(),
  //     ),
  //   );
  //   _loadItem();
  //   // if (newItem == null) {
  //   //   return;
  //   // }
  //   // setState(() {
  //   //   _groceryItem.add(newItem);
  //   // });
  //   //thêm 1 id mới vào danh sách
  // }

  // void _removedItem(GroceryItem item) {
  //   final url = Uri.https('fir-app-shopping-default-rtdb.firebaseio.com',
  //       'shopping-list/${item.id}.json');
  //   http.delete(url);
  //   setState(() {
  //     _groceryItem.remove(item);
  //   });
  // }
  // xóa id của danh sách, xóa trên firebase

  @override
  Widget build(BuildContext context) {
    // Widget content = const Center(
    //   child: Text("Chưa có sản phẩm nào được thêm "),
    // );
    // if (_isLoading) {
    //   content = const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    // if (_groceryItem.isNotEmpty) {
    //   content = ListView.builder(
    //       // itemCount: groceryItems.length,
    //       itemCount: _groceryItem.length,
    //       itemBuilder: (ctx, index) => Dismissible(
    //             key: ValueKey(_groceryItem[index].id),
    //             onDismissed: (direction) {
    //               _removedItem(_groceryItem[index]);
    //             },
    //             child: ListTile(
    //               title: Text(
    //                 _groceryItem[index].name.toUpperCase(),
    //               ),
    //               leading: Container(
    //                 width: 30,
    //                 height: 30,
    //                 color: _groceryItem[index].category.color,
    //               ),
    //               trailing: Text(
    //                 _groceryItem[index].quantity.toString(),
    //                 style: const TextStyle(fontSize: 20),
    //               ),
    //             ),
    //           ));
    // }
    return Scaffold(
      backgroundColor: const Color(0xff3F414E),
      appBar: AppBar(
        backgroundColor: const Color(0xff3F414E),
        title: const Text('Shopping'),
        // actions: [
        //   IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        // ],
        centerTitle: true,
      ),
      bottomNavigationBar: GNav(
          selectedIndex: _selePageIndex,
          onTabChange: (index) {
            setState(() {
              _selePageIndex = index;
            });
          },
          color: const Color(0xFFffffff),
          tabBackgroundColor: const Color(0xFF8E97FD),
          gap: 8,
          padding: const EdgeInsets.all(18),
          activeColor: Colors.black54,
          tabs: const [
            GButton(
              textColor: Color(0xffffffff),
              icon: Icons.home,
              text: 'Trang chủ',
            ),
            GButton(
              icon: Icons.add,
              textColor: Color(0xffffffff),
              text: 'Thêm sản phẩm',
            ),
            GButton(
              icon: Icons.settings,
              textColor: Color(0xffffffff),
              text: 'Cài đặt',
            ),
          ]),
      body: _widgetOption.elementAt(_selePageIndex),
    );
  }
}
