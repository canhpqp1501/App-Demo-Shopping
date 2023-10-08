// ignore_for_file: unused_local_variable, non_constant_identifier_names, unused_field, use_build_context_synchronously

import 'dart:convert';

import 'package:demo_shopping/data/data.dart';
import 'package:demo_shopping/model/category.dart';
import 'package:demo_shopping/widget/home_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _fromKey = GlobalKey<FormState>();
  var _enterName = '';
  var _soLuong = 1;
  // var _addNew = 0;
  final today = DateTime.now();
  var _selectedCategory = categories[Categories.milk]!;
  // tạo tên, số lượng, sản phẩm để thêm vào màn grocety,

  void _saveItem() async {
    if (_fromKey.currentState!.validate()) {
      _fromKey.currentState!.save();
      final url = Uri.https(
          'fir-app-shopping-default-rtdb.firebaseio.com', 'shopping-list.json');
      // tạo url
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},

        body: json.encode(
          {
            'name': _enterName,
            'soLuong': _soLuong,
            // 'addNew': _addNew,
            'category': _selectedCategory.title,
          },
        ),
        // dùng http.post để gửi dữ liệu lên firebase
      );
      // if (response.statusCode == 200) {
      //   print('ok');
      // } else {
      //   print('error');
      // }

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeList()));
    }
  }

  void _reset() {
    _fromKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3F414E),
      // appBar: AppBar(
      //   backgroundColor:const Color(0xff3F414E),
      //   title: const Text('Add 1 item mới'),
      // ),
      body: Form(
          key: _fromKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: const Text('Tên '),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (Value) {
                    if (Value == null ||
                        Value.isEmpty ||
                        Value.trim().length <= 1 ||
                        Value.trim().length >= 50) {
                      return 'Kí tự phải từ 1 đến 50 ';
                    }
                    return null;
                  },

                  // check value, nếu null, cso khoảng trắng, nhỏ hơn 1 hoặc lớn hơn 50 thì in ra lỗi 'Kí tự phải từ 1 đến 50 ';
                  onSaved: (value) {
                    _enterName = value!;
                  },
                  // value khi dc người dùng nhập.
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     maxLength: 50,
              //     decoration: InputDecoration(
              //       label: const Text('new '),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20)),
              //     ),
              //     validator: (Value) {
              //       if (Value == null ||
              //           Value.isEmpty ||
              //           Value.trim().length <= 1 ||
              //           Value.trim().length >= 50) {
              //         return 'Kí tự phải từ 1 đến 50 ';
              //       }
              //       return null;
              //     },

              //     // check value, nếu null, cso khoảng trắng, nhỏ hơn 1 hoặc lớn hơn 50 thì in ra lỗi 'Kí tự phải từ 1 đến 50 ';
              //     onSaved: (value) {
              //       _addNew = int.parse(value!);
              //     },
              //     // value khi dc người dùng nhập.
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Số lượng'),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (Value) {
                          if (Value == null ||
                              Value.isEmpty ||
                              int.tryParse(Value) == null ||
                              int.tryParse(Value)! <= 0) {
                            return 'Số lượng phải trên 1 ';
                          }
                          return null;
                        },
                        onSaved: (Value) {
                          _soLuong = int.parse(Value!);
                          // đổi kiểu số lượng về kiểu int
                        },
                        initialValue: _soLuong.toString(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final Category in categories.entries)
                              DropdownMenuItem(
                                  value: Category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: Category.value.color,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(Category.value.title),
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: _reset, child: const Text('Đặt lại')),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Lưu lại'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("giờ hiện tại là: $today"),
                ],
              ),
            ],
          )),
    );
  }
}
