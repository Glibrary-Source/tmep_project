import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerListTileWidget extends StatefulWidget {

  String title;
  IconData icon;
  VoidCallback? onTap;

  DrawerListTileWidget({super.key, required this.title,required this.icon, this.onTap});

  @override
  State<DrawerListTileWidget> createState() => _DrawerListTileWidgetState();
}

class _DrawerListTileWidgetState extends State<DrawerListTileWidget> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.title),
      onTap: () {
        widget.onTap?.call();
      },
    );
  }
}
