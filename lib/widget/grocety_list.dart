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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3F414E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff3F414E),
        title: const Text('Shopping'),
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
