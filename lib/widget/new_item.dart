// ignore_for_file: unused_local_variable, non_constant_identifier_names, unused_field

import 'package:demo_pass_data/data/data.dart';
import 'package:demo_pass_data/model/category.dart';
import 'package:demo_pass_data/model/grocery_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _fromKey = GlobalKey<FormState>();
  var _enterName = '';
  var _soLuong = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  void _saveItem() {
    if (_fromKey.currentState!.validate()) {
      _fromKey.currentState!.save();
      Navigator.of(context).pop(GroceryItem(
          id: DateTime.now().toString(),
          name: _enterName,
          quantity: _soLuong,
          category: _selectedCategory));
    }
  }

  void _reset() {
    _fromKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add 1 item mới'),
      ),
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
                  TextButton(onPressed: _reset, child: Text('Đặt lại')),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text('Lưu lại'),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
