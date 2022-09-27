import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  final bool hasAppbar;
  final String appBarTitle;
  final bool isCenter;
  const Content(
      {required this.hasAppbar,
      required this.isCenter,
      required this.appBarTitle,
      Key? key})
      : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: widget.hasAppbar
            ? AppBar(
                automaticallyImplyLeading: false,
                centerTitle: widget.isCenter,
                toolbarHeight: 40,
                title: Text(
                  widget.appBarTitle,
                  style: const TextStyle(fontSize: 14),
                ),
              )
            : null,
        body: Container());
  }
}
