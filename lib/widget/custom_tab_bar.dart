import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key, required this.tabs}) : super(key: key);
  final List<Widget> tabs;

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      tabs: widget.tabs,
      onTap: (i){

      },
    );
  }
}
