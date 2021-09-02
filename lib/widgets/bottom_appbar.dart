import 'dart:async';

import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatefulWidget {
  final List<String> listCategories;
  final Function showGridiew;
  const BottomAppBarWidget(
      {Key? key, required this.listCategories, required this.showGridiew})
      : super(key: key);

  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: size.width,
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  widget.listCategories.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          height: 15,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              widget.listCategories[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
                  Text("Filters")
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.import_export)),
                  Text("Price lowest to high")
                ],
              ),
            ),
            Container(
              child:
                  IconButton(onPressed: widget.showGridiew(), icon: Icon(Icons.list_rounded)),
            ),
          ],
        ),
      ],
    );
  }
}
